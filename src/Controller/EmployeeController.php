<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Employee;
use App\Form\EmployeeType;
use App\Repository\EmployeeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\Security\Core\Security;
use App\Entity\Personne;

class EmployeeController extends AbstractController
{
    #[Route('/employee', name: 'employee_index')]
    public function index(EmployeeRepository $employeeRepository): Response
    {
        $employees = $employeeRepository->findAll();

        return $this->render('employee/index.html.twig', [
            'employees' => $employees,
        ]);
    }

//définissons la propriété $security(ctd injection du service Security qui est nécessaire pour accéder à l'utlisateur actuellemnt connecté $this->security->getUser())
    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }

    #[IsGranted('ROLE_USER')]
    #[Route('/employee/profile/{id}', name: 'employee_profile')]
    public function profile(EntityManagerInterface $entityManager, $id): Response
    {
        $employee = $entityManager->getRepository(Employee::class)->find($id);

        if (!$employee) {
            throw $this->createNotFoundException('Aucun employé trouvé pour l\'id '.$id);
        }

        return $this->render('dashboard/employee_profile.html.twig', [
            'employee' => $employee,
        ]);
    }

    
    #[IsGranted('ROLE_ADMIN')]
    #[Route('/employee/new', name: 'employee_new')]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $employee = new Employee(); // Créez une nouvelle instance d'Employee

        $form = $this->createForm(EmployeeType::class, $employee);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Récupérer les données du formulaire et les définir directement sur $employee
            $employee->setName($form->get('name')->getData());
            $employee->setEmail($form->get('email')->getData());
            $employee->setPassword($form->get('password')->getData()); // Assurez-vous de hasher le mot de passe selon vos besoins
            $employee->setRole('2'); // Ici, on assigne une valeur au champ `role`

            // Puisque $employee est déjà une instance de Personne, aucune étape supplémentaire n'est nécessaire pour associer Personne à Employee

            $entityManager->persist($employee);
            $entityManager->flush();

            return $this->redirectToRoute('employee_index');
        }

        return $this->render('employee/new.html.twig', [
            'employee' => $employee,
            'form' => $form->createView(),
        ]);
    }


    #[IsGranted('ROLE_ADMIN')]
    #[Route('/employee/{id}/edit', name: 'employee_edit')]
    public function edit(Request $request, EntityManagerInterface $entityManager, $id): Response
    {
        $employee = $entityManager->getRepository(Employee::class)->find($id);
        if (!$employee) {
            throw $this->createNotFoundException('Aucun employé trouvé pour l\'id '.$id);
        }
        $form = $this->createForm(EmployeeType::class, $employee);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('employee_index');
        }

        return $this->render('employee/edit.html.twig', [
            'employee' => $employee,
            'form' => $form->createView(),
        ]);
    }

    #[IsGranted('ROLE_ADMIN')]
    #[Route('/employee/{id}/delete', name: 'employee_delete')]
    public function delete(Request $request, EntityManagerInterface $entityManager, $id): Response
    {
    $employee = $entityManager->getRepository(Employee::class)->find($id);

    if (!$employee) {
        throw $this->createNotFoundException('Aucun employé trouvé pour l\'id '.$id);
    }

    // Récupérer et supprimer les dépendances
        $leaves = $entityManager->getRepository(\App\Entity\Leave::class)->findBy(['employee' => $employee]);
        foreach ($leaves as $leave) {
            $entityManager->remove($leave);
        }
        if ($this->isCsrfTokenValid('delete'.$employee->getId(), $request->request->get('_token'))) {
            $entityManager->remove($employee);
            $entityManager->flush();
        }

        return $this->redirectToRoute('employee_index');
    }


    
}

