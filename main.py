from flask import Flask, request, render_template
import subprocess
import uuid
import os
app = Flask(__name__)

def run_compiler_from_file(code: str):
    temp_filename = f"temp_{uuid.uuid4().hex}.asm"
    COMPILER_PATH = "Compiler-@Black/580vnx/compiler_.py"

    with open(temp_filename, "w", encoding="utf-8") as f:
        f.write(code)

    try:
        with open(temp_filename, "r", encoding="utf-8") as f:
            result = subprocess.run(
                ["python", COMPILER_PATH, "-f", "hex"],
                stdin=f,
                capture_output=True,
                text=True,
                timeout=5
            )

        stdout = result.stdout.strip()
        stderr = result.stderr.strip()

        if stdout:
            return f"{stderr}\n{stdout}\n"

        return "❔ Compiler gave no output."

    except Exception as e:
        return f"Exception: `{e}`"

    finally:
        try:
            os.remove(temp_filename)
        except Exception:
            pass

@app.route("/", methods=["GET", "POST"])
def index():
    code = ""
    result = ""

    if request.method == "POST":
        code = request.form.get("code", "")
        result = run_compiler_from_file(code)

    return render_template("index.html", code=code, result=result)

if __name__ == "__main__":
    app.run(debug=True, port=5000)