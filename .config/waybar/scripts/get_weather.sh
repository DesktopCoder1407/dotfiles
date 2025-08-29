#!/bin/bash

# Current weather
weather=$(curl -s wttr.in/?format=j2)

# Isolate the temperature
temp=$(echo "$weather" | jq -r '"\(.current_condition.[0].temp_F)°F"' 2> /dev/null)

# Return a fail value if nothing can be curled.
[ "$?" != "0" ] || [ "$weather" == "" ] && echo "{\"text\":\"N/A\"}" && exit


# First tooltip portion (Location info)
locInfo=$(echo "$weather" | jq -r '"Weather for \(.nearest_area.[0].areaName.[0].value), \(.nearest_area.[0].region.[0].value)\\nUpdated \(.current_condition.[0].localObsDateTime)"')

# Second tooltip portion (Extra weather descriptors)
moreInfo=$(echo "$weather" | jq -r '"\(.current_condition.[0].weatherDesc.[0].value), feels like \(.current_condition.[0].FeelsLikeF)°F\\nPrecipitation: \(.current_condition.[0].precipInches)in"')


# Print temp and tooltip (json)
echo "{\"text\":\"${temp}\", \"tooltip\":\"${locInfo}\n\n${moreInfo}\"}"
