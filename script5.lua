-- Define a factorial function to calculate factorial of a number
function factorial(n)
    if n < 1 then
        return 1
    else
        return n * factorial(n - 1)
    end
end

-- Define a sine function to approximate sine of an angle using Taylor series expansion
function sine(x)
    -- Initialize sine_x with the angle x
    sine_x = x
    -- Initialize sign to alternate sign in each term of the series
    sign = -1
    -- Calculate x^2 and x^3
    x_square = x * x
    x_cube = x_square * x

    -- Loop to add terms in Taylor series expansion
    for i = 3, 20, 2 do
        -- Calculate and add the next term in the series
        sine_x = sine_x + sign * (x_cube / factorial(i))
        -- Change sign for the next term
        sign = -sign
        -- Update x^3 for the next term
        x_cube = x_cube * x_square
    end

    -- Return the approximate sine value
    return sine_x
end

-- Loop to test the sine function for angles in degrees from -180 to 180 with step of 30 degrees
for degree = -180, 180, 30 do
    -- Convert degree to radian
    radian = degree * (3.141592653589793 / 180)
    -- Print the angle in degrees and its corresponding sine value
    print(string.format("Sin(%d) = %.6f", degree, sine(radian)))
end
