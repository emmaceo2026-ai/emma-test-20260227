# ReliablePDFExporter

### Purpose
Efficiently exports Markdown documents to PDF format, ensuring compatibility with Windows environments through automated path detection.

### Input
- Markdown file path in the workspace (e.g., `AIAgentGuideExportReady.md`).

### Steps
1. **Run Pandoc**: Use `pandoc` with the `--pdf-engine=xelatex` option to generate a PDF in the home directory (`~/`).
2. **Detect Windows Desktop Path Automatically**:
   - Query via PowerShell:
     ```powershell
     powershell.exe -c 'Write-Host -NoNewline ${env:USERPROFILE}\Desktop'
     ```
   - Convert this path to WSL format using `wslpath`.
   - **Fallback**: Check alternative paths in `/mnt/c/Users/User/OneDrive/Desktop/` and `/mnt/c/Users/User/Desktop/`.
   - If detection fails, log an error and suggest manual copying via `\wsl$`.
3. **Copy the PDF**: Transfer the generated PDF to the detected path (or fallback path).
4. **Log Success/Failure**: Document the operation in daily notes, including the full path of the exported PDF.
5. **Output Confirmation Message**: Provide a message indicating the Windows-accessible path.

### Low-Cost Requirements
- Minimal steps taken with no excessive loops to ensure efficiency.
- Requires:
  - Pandoc and XeLaTeX (already present).
  - PowerShell access (standard in WSL).