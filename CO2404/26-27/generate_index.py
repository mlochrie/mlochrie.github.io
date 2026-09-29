import os
import html

# Automatically resolve paths relative to where this script is located
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
LABS_DIR = os.path.join(SCRIPT_DIR, 'labs')
OUTPUT_FILE = os.path.join(SCRIPT_DIR, 'index.html')

def generate_index():
    print(f"Looking for labs in: {LABS_DIR}")
    
    if not os.path.exists(LABS_DIR):
        print(f"Error: Directory {LABS_DIR} does not exist.")
        return

    files = sorted([f for f in os.listdir(LABS_DIR) if not f.startswith('.')])
    print(f"Found files: {files}")

    html_content = """<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CO2404 Labs - 26/27</title>
    <style>
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; max-width: 800px; margin: 40px auto; padding: 0 20px; line-height: 1.6; color: #333; }
        h1 { border-bottom: 2px solid #eaeaea; padding-bottom: 10px; }
        ul { padding-left: 20px; }
        li { margin: 10px 0; }
        a { color: #0366d6; text-decoration: none; font-weight: 500; }
        a:hover { text-decoration: underline; }
        code { background: #f6f8fa; padding: 2px 6px; border-radius: 4px; font-size: 85%; color: #57606a; }
    </style>
</head>
<body>
    <h1>CO2404 Lab Materials (26/27)</h1>
    <ul>
"""

    for filename in files:
        file_path = os.path.join(LABS_DIR, filename)
        if os.path.isfile(file_path):
            title = filename.replace('-', ' ').replace('_', ' ').rsplit('.', 1)[0].title()
            html_content += f'        <li><a href="labs/{html.escape(filename)}">{html.escape(title)}</a> <code>({html.escape(filename)})</code></li>\n'

    html_content += """    </ul>
</body>
</html>
"""

    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        f.write(html_content)
    
    print(f"Successfully wrote {len(html_content)} characters to {OUTPUT_FILE}")

if __name__ == '__main__':
    generate_index()
