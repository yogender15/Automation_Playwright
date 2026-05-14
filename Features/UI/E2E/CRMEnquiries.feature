@UI
Feature: CRM Enquiries Regression
	 Validate Informal Challenge Features

  Background:
    Given User uses test data with ID 'Proposals_005' from 'Proposals' sheet

  @CRMEnquiries @Regression @P1_A
Scenario:CRMEnquiries01_CTPRELMGMT-1714_CTPRELMGMT-1713_CTPRELMGMT-1712_CTPRELMGMT-1497 Resolving & Reactivating the Enquiry
	#Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForDel'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User is logged in
	#And User Navigates to New Customer Enquiry Page
	#And User enters details on the New Customer Enquiry Screen
	Given User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 25 days after date for 'Evidence Sufficient Date' field value
	And User clicks on 'Channel' dropdown and select 'Phone' value
	And User looked for 'Task Type' field value
	And User looked for 'Contact Type' field value
	And User looked for 'Cust. Enquiry Type' field value
	And User looked for 'To Unit' field value
	And User looked for 'Cust. Enquiry Sub Type' field value
	And User looked for 'Cust. Enquiry Sub Type 2' field value
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validates the status as 'Pending Validation'
	And User clicks on 'Resolve' on the commandbar
	And User selects 'Answered' as Status Reason and 'Deactivate' the Enquiry
	Then User validates the status as 'Answered'
	And User clicks on 'Activate' on the commandbar
	And User selects 'Pending Validation' as Status Reason and 'Activate' the Enquiry
	Then User validates the status as 'Pending Validation'
	And User clicks on 'Resolve' on the commandbar
	And User selects 'No Action' as Status Reason and 'Deactivate' the Enquiry
	Then User validates the status as 'No Action'
	And User clicks on 'Activate' on the commandbar
	And User selects 'Refer to Complaints Team' as Status Reason and 'Activate' the Enquiry
	Then User validates the status as 'Refer to Complaints Team'

	@CRMEnquiries @Regression @P1_A
	Scenario:CRMEnquiries02_CTPRELMGMT-1458
	#And Login to Dynamics application with 'VOA Team Manager' user to work for "1481_E2E_Proposals_MR" case
	And User is logged in to Dynamics application to work for "1481_E2E_Proposals_MR" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	#And User looked for value 'Test Customer' in 'Customer' field
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 0 days before date for 'Date Received in VOA' field value
	And User entered 25 days after date for 'Evidence Sufficient Date' field value
	And User clicks on 'Channel' dropdown and select 'Phone' value
	And User looked for 'Task Type' field value
	And User looked for 'Contact Type' field value
	And User looked for 'Cust. Enquiry Type' field value
	And User looked for 'To Unit' field value
	And User looked for 'Cust. Enquiry Sub Type' field value
	And User looked for 'Cust. Enquiry Sub Type 2' field value
	#And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User enters random days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User clicked on 2 position 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Supplementary Requests' tab from 'Customer Enquiry Form'
	And User clicked on supplementary job id
	And user waits till app progress indicator disappears
	And User scroll to 'Remarks' element
	And User scroll to 'Authority to Act' element
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User looked for 'Reason/Ground' field value only when data not entered
	And User looked for 'Data Source Role' field value only when data not entered

	@CRMEnquiries @Regression
#CTPRELMGMT-1448 -[SIT]-[BST-144185]-Validate the Customer Enquiry SLA is triggered for 'Is Expression of Dissatisfaction' field 
Scenario:CRMEnquiries03_CTPRELMGMT-1448_CTPRELMGMT-1537_[SIT] - Welsh Reform Proposal - Validate creation of SLA item for Tier 2 Referral
And User is logged in to Dynamics application to work for "Tier2_SLA" case
And User collapse if site map navigation expanded on left pane
Given User click on 'Customer Enquiries' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for value 'Test Customer' in 'Customer' field
And User looked for 'Customer Relationship Role' field value
And User entered 0 days before date for 'Date Received in VOA' field value
And User entered 25 days after date for 'Evidence Sufficient Date' field value
And User clicks on 'Channel' dropdown and select 'Phone' value
And User looked for 'Task Type' field value
And User looked for 'Contact Type' field value
And User looked for 'Cust. Enquiry Type' field value
And User looked for 'To Unit' field value
And User looked for 'Cust. Enquiry Sub Type' field value
And User looked for 'Cust. Enquiry Sub Type 2' field value
And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User validates the status as 'Pending Validation'
And User click on 'Refresh' button from 'menubar'
And User scroll to 'Customer Enquiry SLA' element
And user validated 'Customer Enquiry SLA KPI' contains text
And User click on 'Is Expression of Dissatisfaction' toggle button
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And verify status reason as 'Refer to Complaints Team' in the property link page
And User click on 'Tier 2 Referral ?' toggle button
And User enter data for 'Reason for Tier2 Referral' field value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Refresh' button from 'menubar'
And User scroll to 'Customer Enquiry SLA' element
And user validated 'Tier 2 escalation SLA KPI' contains text
And User closes browser


	
	
	
	
 
