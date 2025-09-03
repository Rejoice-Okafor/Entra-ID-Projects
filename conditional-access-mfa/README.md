# Conditional Access & MFA

## Overview
Implemented Microsoft Entra Conditional Access policies to enforce Multi-Factor Authentication (MFA), restrict users from logging in from unknown locations and block legacy authentication. This reduced account takeover risks while maintaining seamless access for compliant users and trusted devices.

## Problem
Employees were signing in from unmanaged devices, unknown and unsecured networks/locations, exposing accounts to phishing and brute-force attacks. Legacy authentication protocols bypassed MFA entirely, creating additional security risks.

## Solution
- Designed and implemented Conditional Access policies requiring MFA for high-risk logins.  
- Blocked legacy authentication protocols (POP/IMAP/SMTP).
- Blocked users from signing in from locations outside the UK. 
- Require devices to be marked as compliant.

## Results
- Account takeover risk reduced significantly.  
- Legacy authentication–based attacks were blocked.  
- Security strengthened without disrupting end-user workflow.

## Highlights / Skills Used
- Microsoft Entra ID  
- Conditional Access  
- Multi-Factor Authentication (MFA)  
- Identity Protection  
- Risk-Based Access Controls  

## Screenshots
![Policy Setup](screenshots/conditional-access-policy.png)  
![Sign-In Logs](screenshots/mfa-enforced-log.png)


