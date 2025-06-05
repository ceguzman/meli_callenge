def update_env(key: str, value: str, env_path: str = ".env"):

    lines = []
    found = False

    with open(env_path, "r", encoding="utf-8") as file:
        for line in file:
            if line.strip().startswith(f"{key}=") or line.strip().startswith(f"export {key}="):
                lines.append(f"export {key}={value}\n")
                found = True
            else:
                lines.append(line)

    if not found:
        lines.append(f"export {key}={value}\n")

    with open(env_path, "w", encoding="utf-8") as file:
        file.writelines(lines)
