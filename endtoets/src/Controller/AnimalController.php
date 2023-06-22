<?php

namespace App\Controller;

use App\Entity\Dier;
use App\Repository\DierRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class AnimalController extends AbstractController
{
    #[Route('/', name: 'app_animal')]
    public function index(): Response
    {
        return $this->render('animal/index.html.twig', [
//
        ]);
    }

    #[Route('/member', name: 'app_member')]
    public function showDier(ManagerRegistry $doctrine ): Response
    {
        $animals = $doctrine->getRepository(Dier::class)->findAll();

        return $this->render('member/index.html.twig', [
            'animals' => $animals
        ]);
    }

    #[Route('/login', name: 'login')]
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        $error =$authenticationUtils->getLastAuthenticationError();
        $lastUsername =$authenticationUtils->getLastUsername();
        return $this->render('animal/inloggin.html.twig', [
            'last_username'=>$lastUsername,
            'error'=>$error

        ]);
    }
    #[Route('/logout', name: "logout")]
    public function logout(): Response
    {
       throw new \Exception('Don\'t forget to activate logout in security.yaml');
    }

    #[Route('/redirect', name: "redirect")]
    public function redirectAction( Security $security): Response
    {
      if($security->isGranted('ROLE_ADMIN')){
          return $this->redirectToRoute('app_admin');
      }
        if($security->isGranted('ROLE_MEMBER')) {
            return $this->redirectToRoute('app_member');
        }
        return $this->redirectToRoute('app_login');
    }


}
