public class practica {
    public static void main(String[] args) {
        String position = "director";
        boolean alcanzoObjetivos = true;
        double bonus = switch (position) {
            case "temporal" -> 2000;
            case "empleado" -> 1000;
            case "director" -> {
                double bonusBase = 10;
                double bonusPorRendimiento = alcanzoObjetivos ? 500 : 0;
                double bonusTotal = bonusBase + bonusPorRendimiento;
                yield bonusTotal;
            }
            default -> 0;
        };
        System.out.println("El bonus del " + position + " es $" + bonus);
    }
}
