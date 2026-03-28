STATUS=$(cat /sys/class/power_supply/ADP0/online)

if [ "$STATUS" = "0" ]; then
  # ON BATTERY: Force "Blue LED" (Quiet Mode) + Low Brightness
  echo low-power | sudo tee /sys/firmware/acpi/platform_profile
  brightnessctl set 30%
else
  # ON AC: Force "Red/White LED" (Performance/Balanced)
  echo performance | sudo tee /sys/firmware/acpi/platform_profile
fi
