import os
import html

LABS_DIR = 'CO2404/26-27/labs'
OUTPUT_FILE = 'CO2404/26-27/index.html'

def generate_index():
    if not os.path.exists(LABS_DIR):
        print(f"Directory {LABS_DIR} not found.")
        return

    files = sorted([f for f in os.listdir(LABS_DIR) if not f.startswith('.')])

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
    print(f"Successfully generated {OUTPUT_FILE}")

if __name__ == '__main__':
    generate_index()
