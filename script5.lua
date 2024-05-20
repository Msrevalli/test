-- Define pi constant
local pi = 3.141592653589793

-- Define a factorial function to calculate factorial of a number using memoization
local factorials = {1}
function factorial(n)
    if factorials[n] then
        return factorials[n]
    else
        factorials[n] = n * factorial(n - 1)
        return factorials[n]
    end
end

-- Define a sine function to approximate sine of an angle using Taylor series expansion
function sine(x)
    local sine_x = x
    local term = x
    local sign = -1

    for i = 3, 19, 2 do
        term = term * x * x / (i - 1) / i
        sine_x = sine_x + sign * term
        sign = -sign
    end

    return sine_x
end

-- Function to validate user input within the range of -360 to 360
function validateInput(angle)
    return type(angle) == "number" and angle >= -360 and angle <= 360
end

-- Test data for sine function
local test_data = {
    -- Functional tests
    {angle = 0, expected_sine = 0},
    {angle = 30, expected_sine = 0.5},
    {angle = 45, expected_sine = 0.707107},
    {angle = 60, expected_sine = 0.866025},
    {angle = 90, expected_sine = 1},
    {angle = 180, expected_sine = 0},
    {angle = -30, expected_sine = -0.5},
    {angle = -45, expected_sine = -0.707107},
    {angle = -60, expected_sine = -0.866025},
    {angle = -90, expected_sine = -1},
    -- Special angles
    {angle = 180, expected_sine = 0},
    {angle = 360, expected_sine = 0},
    {angle = -360, expected_sine = 0},
    -- Edge cases
    {angle = 1e-10, expected_sine = 1e-10},  -- Very small positive angle
    {angle = -1e-10, expected_sine = -1e-10}, -- Very small negative angle
    {angle = 1e10 % 360, expected_sine = math.sin((1e10 % 360) * pi / 180)},   -- Very large positive angle
    {angle = -1e10 % 360, expected_sine = math.sin((-1e10 % 360) * pi / 180)},  -- Very large negative angle
    -- Invalid inputs
    {angle = "abc", expected_sine = nil}, -- Non-numeric input
    {angle = nil, expected_sine = nil},   -- Nil input
    {angle = {}, expected_sine = nil},    -- Invalid input type
}

-- Open CSV file for writing
local file = io.open("sine_results.csv", "w")

-- Write header to CSV file
file:write("Angle,Expected Sine,Result,Pass\n")

-- Run tests
for _, data in ipairs(test_data) do
    local angle = data.angle
    local expected_sine = data.expected_sine
    
    -- Handle invalid inputs
    if validateInput(angle) then
        -- Convert degree to radian
        local radian = angle * (pi / 180)
        local result = sine(radian)
        local pass = expected_sine and math.abs(result - expected_sine) < 0.0001
        -- Format the result for display
        result = string.format("%.6f", result)
        -- Write test data to CSV file
        file:write(string.format("%s,%s,%s,%s\n", angle, expected_sine, result, pass and "Yes" or "No"))
    else
        file:write(string.format("Invalid input: %s,%s,nil,No (Input out of range)\n", tostring(angle), tostring(expected_sine)))
    end
end

-- Close CSV file
file:close()

-- User input test case
print("Enter an angle between -360 and 360:")
local user_input = io.read("*n")

if validateInput(user_input) then
    -- Convert degree to radian
    local radian = user_input * (pi / 180)
    local user_result = sine(radian)
    print(string.format("The sine of %d degrees is approximately %.6f", user_input, user_result))
else
    print("Invalid input. Please enter a number between -360 and 360.")
end
