<?php

namespace App\Entity;

use App\Repository\AdminRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AdminRepository::class)]
class Admin extends Personne
{
    /*
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null; */

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $admin_title = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $admin_phone = null;

    /*
    #[ORM\ManyToOne(inversedBy: 'admins')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Personne $personne = null; */

    /*
    public function getId(): ?int
    {
        return $this->id;
    } */

    public function getAdminTitle(): ?string
    {
        return $this->admin_title;
    }

    public function setAdminTitle(?string $admin_title): static
    {
        $this->admin_title = $admin_title;

        return $this;
    }

    public function getAdminPhone(): ?string
    {
        return $this->admin_phone;
    }

    public function setAdminPhone(?string $admin_phone): static
    {
        $this->admin_phone = $admin_phone;

        return $this;
    }

    /*
    public function getPersonne(): ?Personne
    {
        return $this->personne;
    }

    public function setPersonne(?Personne $personne): static
    {
        $this->personne = $personne;

        return $this;
    } */
}
