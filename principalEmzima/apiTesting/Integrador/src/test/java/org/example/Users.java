package org.example;
import com.github.javafaker.Faker;
import java.util.Objects;

public class Users {
    private String name;
    private String email;
    private int age;
    private String accountNumber;
    private double balance;



    // Constructor vacío (necesario para serialización)
    public Users() {}

    // Constructor con parámetros
    public Users(String name, String email, int age, String accountNumber, float balance) {
        this.name = name;
        this.email = email;
        this.age = age;
        this.accountNumber = accountNumber;
        this.balance = balance;
    }

    // Getters y Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getAccountNumber() { return accountNumber; }
    public void setAccountNumber(String accountNumber) { this.accountNumber = accountNumber; }

    public double getBalance() { return balance; }
    public void setBalance(double balance) { this.balance = balance; }

    // Métodos para comparación y unicidad
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Users user = (Users) o;
        return Objects.equals(email, user.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(email);
    }

    // Método para generar usuario aleatorio
    public static Users generarUsuarioAleatorio(Faker faker) {
        return new Users(
                faker.name().fullName(),
                faker.internet().emailAddress(),
                faker.number().numberBetween(18, 80),
                "-",
                0

        );
    }

    @Override
    public String toString() {
        return "Users {" +
                "name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", age=" + age +
                ", accountNumber='" + accountNumber + '\'' +
                ", balance=" + balance +
                '}';
    }
}
