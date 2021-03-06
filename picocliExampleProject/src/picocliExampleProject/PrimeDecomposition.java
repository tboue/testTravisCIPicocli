package picocliExampleProject;
import java.util.ArrayList;
import java.util.concurrent.Callable;

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;

@Command(name = "primeDecomposition", mixinStandardHelpOptions = true, version = "checksum 4.0", description = "Prints the prime Decomposition of the given parameter")
class PrimeDecomposition implements Callable<Integer> {

	//Takes number as parameter, better but can't launch from eclipse
	@Parameters(index = "0", description = "The integer to test")
	private long number;

	@Override
	public Integer call() throws Exception {
		ArrayList<String> primeList = new ArrayList<String>();
		getListGreaterPrime(primeList, number);
		System.out.print("Prime Decomposition : ");
		for (String e : primeList) {
			System.out.print(e + " ");
		}
		return 0;
	}

	public ArrayList<String> getListGreaterPrime(ArrayList<String> primeList, long numberToTest) {
		boolean isPrime = true;
		double numberToTestDBL = numberToTest;
		double rootToTest = Math.sqrt(numberToTest);
		double i = 2;
		double division = (numberToTestDBL / i);
		while ((rootToTest <= division) && isPrime) {
			division = (numberToTestDBL / i);
			if (division % 1 == 0) {
				isPrime = false;
				getListGreaterPrime(primeList, (long) i);
				getListGreaterPrime(primeList, (long) division);
			}
			i++;
		}
		if (isPrime) {
			primeList.add(String.valueOf(numberToTest));
		}
		return primeList;
	}

	// this example implements Callable, so parsing, error handling and handling
	// user
	// requests for usage help or version help can be done with one line of code.
	public static void main(String... args) {
		int exitCode = new CommandLine(new PrimeDecomposition()).execute(args);
		System.exit(exitCode);
	}
}