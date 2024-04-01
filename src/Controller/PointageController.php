<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use App\Repository\PointageRepository;
use Symfony\Component\Security\Core\Security;
use App\Form\PointageType;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Pointage;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry; // For fetching data from database




class PointageController extends AbstractController
{/*
    #[Route('/pointage', name: 'app_pointage')]
    public function index(): Response
    {
        return $this->render('pointage/index.html.twig', [
            'controller_name' => 'PointageController',
        ]);
    }*/



    #[Route('/pointage', name: 'pointage_index')]
    public function index(PointageRepository $pointageRepository, Security $security): Response
    {
        $user = $security->getUser();
        $year = date('Y');
        $month = date('m');

        // Déterminer si l'utilisateur est un admin
        $isAdmin = in_array('ROLE_ADMIN', $user->getRoles());

        if ($isAdmin) {
            // Récupérer le pointage de tous les employés pour le mois et l'année en cours
            // Cette méthode hypothétique findByMonthAndYear doit être implémentée dans votre PointageRepository
            $pointages = $pointageRepository->findByMonthAndYear($year, $month);
        } else {
            // Récupérer le pointage de l'employé connecté
            // La méthode findByEmployeeAndMonth doit être adaptée ou créée dans votre PointageRepository
            $pointages = $pointageRepository->findByEmployeeAndMonth($user->getId(), $year, $month);
        }

        return $this->render('pointage/index.html.twig', [
            
            'pointages' => $pointages,
            'isAdmin' => $isAdmin,
            'year' => $year,
            'month' => $month,
        ]);
    }

/*
    #[Route('/pointage/new', name: 'pointage_new')]
    public function new(Request $request, EntityManagerInterface $entityManager, Security $security): Response
    {
        $pointage = new Pointage();
        $form = $this->createForm(PointageType::class, $pointage);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Assurez-vous de définir l'employé pour le pointage, si nécessaire
            $pointage->setEmployee($this->getUser());

            $entityManager->persist($pointage);
            $entityManager->flush();

            // Redirection ou affichage d'un message de succès...
        }

        return $this->render('pointage/new.html.twig', [
            'form' => $form->createView(),
        ]);
    }

 */
    
    // Autres actions comme la création, la modification, la suppression...


    

}

