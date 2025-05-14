input_file = "requirements.txt"
output_file = "requirements_clean.txt"

with open(input_file, "r", encoding="utf-8") as f:
    lines = f.readlines()

cleaned = [line for line in lines if "file:///" not in line and "@ file:///" not in line]

with open(output_file, "w", encoding="utf-8") as f:
    f.writelines(cleaned)

print(f"Cleaned requirements saved to {output_file}")
