import java.util.Scanner;
import java.util.Random;
/**;
 * A simple cli program for rolling TTRPG die
 *
 * @author (Melencholy Solaine)
 * @version (V1.0)
 */
public class TTRPGRoller
{
    public static int convertNumber(String number){ //converts the number of rolls to an int, errors out if there is no number
        int intNumber;
        try{
            intNumber = Integer.parseInt(number);
            return(intNumber);
        }
        catch(NumberFormatException e){
            intNumber = 0;
            return(intNumber);
        }
    }

    public static int convertDie(String die){ //converts the die to an int, errors out if there is no number
        int intDie;
        try{
            intDie = Integer.parseInt(die);
            return(intDie);
        }
        catch(NumberFormatException e){
            intDie = 0;
            return(intDie);
        }
    }

    public static void main (String[] args){
        Scanner keyInput = new Scanner(System.in);
        boolean started = true;
        String format;
        while(started){
            System.out.println("⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘");
            System.out.println("Welcome adventurer! to the TTRPG Dice Roller!\n Type q to exit\n");
            System.out.println("Please enter a dice roll: (eg: 6d12):");
            System.out.println("⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘⫘");
            format = keyInput.next();
            boolean running = true;
            while(running){
                int intNumber;
                int intDie;
                if(format.toLowerCase().contains("d")){ //checks if the input has a D in it (case insensitive)
                    String[] parts = format.toLowerCase().split("d"); //splits the user input into 2 parts, using the D as the splitpoint
                    String number = parts[0]; //first half (the number of die) becomes "number"
                    String die = parts[1]; //second half (the die size) become "die"
                    intNumber = convertNumber(number); //sends the "Number" string into convertNumber, and puts the output to "intNumber"
                    intDie = convertDie(die); //sends the "die" string into convertDie, and puts the output to "intDie"
                    Random random = new Random(); //time to get freaky
                    int sum = 0;
                    System.out.println("Rolling " + format + ";"); //tells the user what the roll is
                    if(intNumber > 0 && intDie > 0){ //makes sure neither variable are 0 or lower
                        for(int i = 0; i < intNumber; i++){ //rolls a random number for each number in "intNumber"
                            int roll = random.nextInt(intDie) + 1; //the max the random value can be is the value of "intDie, min is 1"
                            System.out.println("Roll #" + (i + 1) + ": " + roll); //tells the user the value of each roll
                            sum += roll; //adds each roll to the sum int
                        }
                        System.out.println("Total: " + sum); //prints out the sum at the end of the roll session
                        running = false;
                    }
                    else{ //errors if 0 or less, also handles NumberFormatException from the convert methods
                        System.out.println("Invalid Input; values must be greater than 0.");
                        running = false;
                    }
                }
                else if(format.toLowerCase().contains("q")){ //if the user types q, exits a la vi
                    started = false;
                    running = false;
                }
                else{ //gotta be the right format
                    System.out.println("Invalid input; please enter 2 numbers seperated by 'd'");
                    running = false;
                }
            }
        }
    }
}