<?php

namespace App\Controller;

use App\Entity\Dier;
use App\Form\NewDierType;
use App\Repository\DierRepository;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use http\Client\Curl\User;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'app_admin')]
    public function index( ManagerRegistry $doctrine ): Response
    {
        $name = $this->getUser();
        $showAdminAnimal = $doctrine->getRepository(Dier::class)->findBy(['user'=>$name]);

        return $this->render('admin/index.html.twig', [
            'show'=>$showAdminAnimal

        ]);
    }
    #[Route('/adddier', name: 'insert')]
    public function insert (Request $request , EntityManagerInterface $entityManager): Response
    {
        $add = new Dier();
        $form = $this->createForm(NewDierType::class, $add);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $add = $form->getData();
            $entityManager->persist($add);
            $entityManager->flush();

            return $this->redirectToRoute('app_admin');
        }

        return $this->renderForm('admin/adddier.html.twig', [
            'form' => $form,
        ]);

    }
    #[Route('/deletedier/{id}', name: 'delete')]
    public function delete(EntityManagerInterface $entityManager, int $id): Response
    {

        ;
        $delete = $entityManager->getRepository(Dier::class)->find($id);
        if (!$delete) {
            throw $this->createNotFoundException(
                'No product found for id ' . $id
            );
        }
        $entityManager->remove($delete);
        $entityManager->flush();

        return $this->redirectToRoute('app_admin');

    }

}
