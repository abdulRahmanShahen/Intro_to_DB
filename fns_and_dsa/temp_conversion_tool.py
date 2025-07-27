# Define global conversion factors
CELSIUS_TO_FAHRENHEIT_FACTOR = 9 / 5
FAHRENHEIT_TO_CELSIUS_FACTOR = 5 / 9
FAHRENHEIT_FREEZING_POINT = 32

# Convert Fahrenheit to Celsius
def convert_to_celsius(fahrenheit):
    return (fahrenheit - FAHRENHEIT_FREEZING_POINT) * FAHRENHEIT_TO_CELSIUS_FACTOR

# Convert Celsius to Fahrenheit
def convert_to_fahrenheit(celsius):
    return (celsius * CELSIUS_TO_FAHRENHEIT_FACTOR) + FAHRENHEIT_FREEZING_POINT

def main():
    try:
        temp_input = input("Enter the temperature to convert: ").strip()
        temperature = float(temp_input)

        unit = input("Is this temperature in Celsius or Fahrenheit? (C/F): ").strip().upper()

        if unit == 'F':
            result = convert_to_celsius(temperature)
            print(f"{temperature}°F is {result:.2f}°C")
        elif unit == 'C':
            result = convert_to_fahrenheit(temperature)
            print(f"{temperature}°C is {result:.2f}°F")
        else:
            print("Invalid unit. Please enter 'C' for Celsius or 'F' for Fahrenheit.")
    except ValueError:
        print("Invalid temperature. Please enter a numeric value.")

if __name__ == "__main__":
    main()

