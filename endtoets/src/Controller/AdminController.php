<?php

namespace App\Controller;

use App\Entity\Dier;
use App\Repository\DierRepository;
use http\Client\Curl\User;
use Symfony\Bridge\Doctrine\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'app_admin')]
    public function index( ManagerRegistry $doctrine, int $id ): Response
    {
//        $showAdminAnimal = $doctrine->getRepository(Dier::class)->find($id);

        return $this->render('admin/index.html.twig', [
//            'show'=>$showAdminAnimal

        ]);
    }
}
