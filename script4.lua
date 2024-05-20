-- Function to get country code from country name
function get_country_code(country)
    local csv_file = io.open("country_calling_codes.csv", "r")  -- Open the CSV file for reading
    if not csv_file then
        print("Error opening CSV file")
        return nil
    end
    
    -- Read each line in the CSV file
    for line in csv_file:lines() do
        local country_name, country_code = line:match('"?(.-)"?,(%+%d+)')
        if country_name and country_code then
            if country_name:lower() == country:lower() then
                csv_file:close()  -- Close the CSV file
                return country_code  -- Return the country code if the country name matches
            end
        end
    end
    
    csv_file:close()  -- Close the CSV file
    
    return nil  -- Return nil if the country code is not found
end

-- Prompt the user to enter a country name
print("Enter a country name:")
local input_country = io.read()  -- Read user input

-- Call the get_country_code function with the user-provided input
local country_code = get_country_code(input_country)

-- Check if the country code was found
if country_code then
    print("Country code: " .. country_code)
else
    print("Country code not found")
end
