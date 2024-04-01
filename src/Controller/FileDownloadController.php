<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\ResponseHeaderBag;
use Symfony\Component\Security\Core\Security;


class FileDownloadController extends AbstractController
{
    #[Route('/file/download', name: 'app_file_download')]
    public function index(): Response
    {
        return $this->render('file_download/index.html.twig', [
            'controller_name' => 'FileDownloadController',
        ]);
    }

    private $security;

    public function __construct(Security $security)
    {
        $this->security = $security;
    }

    #[Route('/download/{filename}', name: 'download_file')]
    public function downloadFile(string $filename)
    {
        // Ici, nous vérifions si l'utilisateur a le rôle ADMIN
        // Adaptez cette vérification selon votre logique métier
        if (!$this->security->isGranted('ROLE_USER')) {
            // Si l'utilisateur n'a pas le bon rôle, renvoyez une réponse d'accès refusé
            throw $this->createAccessDeniedException('Vous n\'avez pas la permission d\'accéder à ce fichier.');
        }

        $filePath = $this->getParameter('medical_certificates_directory').'/'.$filename;

        if (!file_exists($filePath)) {
            throw $this->createNotFoundException('Le fichier n\'existe pas.');
        }

        $response = new BinaryFileResponse($filePath);
        $response->setContentDisposition(
            ResponseHeaderBag::DISPOSITION_ATTACHMENT,
            $filename
        );

        return $response;
    }
}

