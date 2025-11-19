#include <iostream>
#include <random>
#include <iomanip>
#include <cmath>

int main(int argc, char* argv[]) {
    long long iterations = 10'000'000;

    if (argc > 1) {
        iterations = std::stoll(argv[1]);
    }

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(0.0, 1.0);

    long long inside_circle = 0;

    std::cout << "Running Monte Carlo simulation with "
              << iterations << " iterations...\n";

    for (long long i = 0; i < iterations; ++i) {
        double x = dis(gen);
        double y = dis(gen);

        if (x * x + y * y <= 1.0) {
            inside_circle++;
        }
    }

    double pi_estimate = 4.0 * inside_circle / iterations;

    std::cout << std::fixed << std::setprecision(10);
    std::cout << "Estimated π: "   << pi_estimate << std::endl;
    std::cout << "Actual π: "      << M_PI << std::endl;
    std::cout << "Error: "         << std::abs(pi_estimate - M_PI) << std::endl;

    return 0;
}
