<?php

namespace App\Entity;

use App\Repository\PersonneRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Doctrine\ORM\Mapping as ORM;


#[ORM\Entity(repositoryClass: PersonneRepository::class)]
#[ORM\InheritanceType("JOINED")]
#[ORM\DiscriminatorColumn(name: "type", type: "string")]
#[ORM\DiscriminatorMap(["personne" => "Personne", "admin" => "Admin", "employee" => "Employee"])]
class Personne implements UserInterface, PasswordAuthenticatedUserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $name = null;

    #[ORM\Column(length: 255)]
    private ?string $email = null;

    #[ORM\Column(length: 255)]
    private ?string $password = null;

    #[ORM\Column]
    private ?int $role = null;

    #[ORM\OneToMany(mappedBy: 'personne', targetEntity: Admin::class)]
    private Collection $admins;

    #[ORM\OneToMany(mappedBy: 'personne', targetEntity: Employee::class)]
    private Collection $employees;

    public function __construct()
    {
        $this->admins = new ArrayCollection();
        $this->employees = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function getUsername(): ?string
    {
        return $this->email;
    }

    public function setUsername(string $email): static
    {
        $this->email = $email;

        return $this;
    }

    // ajout des méthodes getEmail et setEmail dans l' entité Personne qui appellent simplement getUsername et setUsername(pour éviter l'erreur impossible de lire email)
    public function getEmail(): ?string
    {
    return $this->getUsername();
    }

    public function setEmail(string $email): self
    {
    $this->setUsername($email);
    return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): static
    {
        $this->password = $password;

        return $this;
    }

    public function getRoles(): array
    {
        $roles = [];

        if ($this->role === 1) {
            $roles[] = 'ROLE_ADMIN';
        } elseif ($this->role === 2) {
            $roles[] = 'ROLE_USER';
        }

        // Assurez-vous qu'il y a toujours au moins un rôle par défaut
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }
    // ajout de la méthode getRole dans l' entité Personne (pour éviter l'erreur impossible de lire role)
    public function getRole(): ?int {
        return $this->role;
    }

    public function setRole(int $role): static
    {
        $this->role = $role;

        return $this;
    }

    public function __toString(): string
    {
    return $this->name; // Ou $this->email, selon ce qui a le plus de sens pour votre application.
    }


     // Méthode requise par UserInterface
     public function getUserIdentifier(): string
     {
         return (string) $this->email;
     }

    public function getSalt(): ?string
    {
        return null;
    }

    public function eraseCredentials()
    {
    // Si vous stockez des données sensibles temporaires, effacez-les ici
    }


    /**
     * @return Collection<int, Admin>
     */
    public function getAdmins(): Collection
    {
        return $this->admins;
    }

    public function addAdmin(Admin $admin): static
    {
        if (!$this->admins->contains($admin)) {
            $this->admins->add($admin);
            $admin->setPersonne($this);
        }

        return $this;
    }

    public function removeAdmin(Admin $admin): static
    {
        if ($this->admins->removeElement($admin)) {
            // set the owning side to null (unless already changed)
            if ($admin->getPersonne() === $this) {
                $admin->setPersonne(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Employee>
     */
    public function getEmployees(): Collection
    {
        return $this->employees;
    }

    public function addEmployee(Employee $employee): static
    {
        if (!$this->employees->contains($employee)) {
            $this->employees->add($employee);
            $employee->setPersonne($this);
        }

        return $this;
    }

    public function removeEmployee(Employee $employee): static
    {
        if ($this->employees->removeElement($employee)) {
            // set the owning side to null (unless already changed)
            if ($employee->getPersonne() === $this) {
                $employee->setPersonne(null);
            }
        }

        return $this;
    }
}
