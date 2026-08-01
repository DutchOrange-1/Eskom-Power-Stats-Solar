data = eskom_power_population_1986_2025;
years = data.year;
power = data.power_gwh;
population = data.population; 

cut_power = power(1: 23);
years_short = years(1:23);
[p,S] = polyfit(years_short, cut_power, 1);
predicted_power = p(1)*years + p(2);


delta = (predicted_power(end) - power(end))
% R 1786 per megawhat
cost = (1786 * delta * 1e3)/1e9;

figure 
title(sprintf('Delta production: %.2f TWh, or R %.2f Billion per year', delta/1e3, cost))
hold on
grid on
yyaxis left
plot(years, power/1e3, 'DisplayName', 'Power')
hold on
plot(years, predicted_power/1e3, 'DisplayName', 'predicted power')
ylabel("TWh")
yyaxis right
plot(years, population, 'DisplayName', 'population')
ylabel("Population")
legend('Location', 'best')




