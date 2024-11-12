function Set-ChromeEdge {
  $regkeyChrome = "HKLM:\SOFTWARE\Policies\Google\Chrome"
  if (-not (Test-Path $regkeyChrome)) {
    New-Item -Path $regkeyChrome -Force | Out-Null
  }
  if (-not (Test-Path "$regkeyChrome\PostQuantumKeyAgreementEnabled")) {
    New-ItemProperty -Path $regkeyChrome -Name "PostQuantumKeyAgreementEnabled" -Type DWord -Value 0 -ErrorAction SilentlyContinue
  } else {
    Set-ItemProperty -Path $regkeyChrome -Name "PostQuantumKeyAgreementEnabled" -Value 0 -ErrorAction SilentlyContinue
  }

  $regkeyEdge = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
  if (-not (Test-Path $regkeyEdge)) {
    New-Item -Path $regkeyEdge -Force | Out-Null
  }
  if (-not (Test-Path "$regkeyEdge\PostQuantumKeyAgreementEnabled")) {
    New-ItemProperty -Path $regkeyEdge -Name "PostQuantumKeyAgreementEnabled" -Type DWord -Value 0 -ErrorAction SilentlyContinue
  } else {
    Set-ItemProperty -Path $regkeyEdge -Name "PostQuantumKeyAgreementEnabled" -Value 0 -ErrorAction SilentlyContinue
  }
}