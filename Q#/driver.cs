using System;
using Microsoft.Quantum.Simulation.Simulators;

namespace qsharp {
	public class Driver {
		public static void Main(string[] args) {
			Asciiart.Run(new QuantumSimulator()).Wait();
		}
	}
}
