-- Function to get country code from country name
function get_country_code(country)
    -- Define a table mapping country names to country codes
    local country_codes = {
        ['India'] = 91,
        ['USA'] = 1,
        ['UK'] = 44,
        ['Canada'] = 1,
        ['Australia'] = 61
        -- Add more country codes as needed
    }
    
    -- Check if the input country name exists in the country_codes table
    if country_codes[country] then
        -- If the country name exists, return the corresponding country code
        return country_codes[country]
    else
        -- If the country name doesn't exist, return a message indicating that the country code was not found
        return "Country code not found"
    end
end

-- Test the function with different inputs
print(get_country_code('India'))       -- Output: 91
print(get_country_code('USA'))         -- Output: 1
print(get_country_code('UK'))          -- Output: 44
print(get_country_code('Canada'))      -- Output: 1
print(get_country_code('Australia'))   -- Output: 61
print(get_country_code('Japan'))       -- Output: Country code not found
