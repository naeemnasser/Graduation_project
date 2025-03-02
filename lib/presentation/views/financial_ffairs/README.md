# Financial Affairs Module

## Overview
The Financial Affairs module provides comprehensive financial management features for students, staff, and administrators. It allows users to manage payments, generate receipts, submit petitions, and view financial statistics.

## Features
- **Financial Dashboard**: Central hub for all financial operations
- **Payment Management**: Search for students and manage their payments
- **Petition Receipts**: View and print petition receipts
- **Petition Requests**: Submit and track petition requests
- **Financial Statistics**: View financial data and statistics
- **Payment Form**: Process new payments

## Navigation Structure
- Home Screen → Financial Affairs Dashboard
  - → Payment Management
  - → Petition Receipt
  - → Petition Request
  - → Financial Statistics
  - → Payment Form

## Usage
1. Navigate to the Financial Affairs section from the Home Screen
2. Select the desired financial operation from the dashboard
3. Complete the required information in the forms
4. Submit or print as needed

## Implementation Details
- All screens use the `AppBarWidget` for consistent navigation
- Custom back navigation is implemented to ensure proper flow between screens
- Forms include validation to ensure data integrity
- Statistics visualizations use the fl_chart package

## Files
- `financial_dashboard.dart`: Main entry point for financial affairs
- `details_page.dart`: Payment management and search
- `petition_receipt_view.dart`: View and print receipts
- `petition_request.dart`: Submit petition requests
- `Manger.dart`: Financial statistics and reports
- `payment_form.dart`: Process new payments

## Future Enhancements
- Integration with payment gateways
- Export financial reports to PDF
- Student financial history tracking
- Automated payment reminders