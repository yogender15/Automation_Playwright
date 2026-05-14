Feature: Ignore
#CDC

@ignore
Scenario: 11. Validate Job Creation for CompositePropertyChange Business Processes without DB
	Given User uses test data with ID 'CPC_001' from 'TestDataPart4' sheet
	And User is logged in
	And User click on 'Submissions' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Integration Data Source' field value from 'TestDataPart4' for 'CPC_001'
	And User looked for 'Submitted By' field value from 'TestDataPart4' for 'CPC_001'
	And User looked for 'Relationship Role' field value from 'TestDataPart4' for 'CPC_001'
	And User click on 'Save' button from 'menubar'
	And User scroll to 'Related Requests' element
	And User click on 'New Request' button
	And User looked for 'Request Type' field value from 'TestDataPart4' for 'CPC_001'
	And User looked for 'Job Type' field value from 'TestDataPart4' for 'CPC_001'
	And User click on the 'Find Hereditament' button
	And User entered data for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value from 'TestDataPart4' for 'CPC_001'
	And User click on 'Save' button from 'menubar'
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Composite Property Change' BP

@Ignore
Scenario: 12. Validate Sharepoint Integration for Individual Job
	Given User uses test data with ID 'CPC_003' from 'TestDataPart4' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForEDC'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Composite Property Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Composite Property Change' BP
	Then User validates and clicks the 'Documents' tab present in the 'Job Form' tablist
	And User clicks on 'Upload' button and selects 'This Job'
	And User clicks on 'Choose Files' and uploads the document
	And User selects 'BA information' from 'Document Type' dropdown on the Document Dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the upload status message
	

@Ignore
Scenario: 13. Validate CTBT Integration
	Given User uses test data with ID 'CPC_001' from 'TestDataPart4' sheet
	And User connects to the DB and retrieves the data for 'findhereditament'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Composite Property Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Composite Property Change' BP
	And User navigates to 'Jobs' under 'Service'
	And User filters the View Selector to 'All Jobs'
	And User filters the 'Composite Property Change' job created from the 'Job ID' column
	And User selects the 'Composite Property Change' job created from the 'Job ID' column
	And User filters the job and assign to himself and opens the job
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates the questionnaire in the 'Researching' BPF pop-up for 'Composite Property Change'
	When And user selects the 'LinkedAssessmentConfirmedDropdown' with any dropdown value
	And And user selects the 'CompositeChangeTypeDropdown' with any dropdown value
	Given User clicks on 'Save' on the commandbar
	Then User validates and clicks the 'PVT' tab present in the 'Desktop Research Form' tablist
	And User clicks on the 'ChevronRightMed' in the PVT tab
	Then User validates and clicks the 'Amend' and 'Continue' on PVT tablist
	And User fills the mandatory fields in Property Attributes section under PAD Entry tab of Researching stage for 'Composite Property change' process
	And User clicks on 'Save' on the commandbar
	And User clicks on the New Source Code Button in Source Codes section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Attribute Set Source Code Page
	And User clicks on 'Save & Close' on the commandbar
	And User fills the mandatory fields in PAD Validation section under General tab of Validate PAD stage for 'Composite'
	And User clicks on 'Save' on the commandbar
	Then User validates the 'PAD Validation Outcome' as 'Pass'
	And user waits for '60' secs
	And User click on 'No' button for NDR Assessment
	And User clicks on 'Refresh' on the commandbar
	Then User validates '---' for Is Banding Complete on 'Undertake Banding' BPF journey
	Then User validates and clicks the 'Banding' tab present in the 'Job Form' tablist
	And User clicks on 'Refresh' on the commandbar
	And User clicks on New Comparable Property Sets Button to validate CTBT Integration
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' after CTBT is loaded

#EDC feature 
@Ignore
Scenario: 05. Effective Date Change on Material Reduction - Backward Date (BST-87363)(Invalid)
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForEDC'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change - Backward' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP
	And User navigates to 'Jobs' under 'Service'
	And User filters the View Selector to 'All Jobs'
	And User filters the 'Effective Date Change' job created from the 'Job ID' column
	And User filters the job and assign to himself and opens the job
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Effective Date Change'
	And User clicks on 'Save' on the commandbar
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	And User navigates to 'Proposed Assessments' tab to validate the below components of Assessments
		| EffectiveFrom           | EffectiveTo | CompIndicator | TaxBand | AssessmentStatus     | PublicationStatus |
		| Proposed Effective Date |             |               |         | Current (live entry) | Unpublished       |
	And User enters the fields on 'Maintain Assessment' BPF Journey pop-up
	Then User validates the status as 'List Updated'
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	And User navigates to 'History' tab to validate the below components of Assessments
		| EffectiveFrom           | EffectiveTo             | CompIndicator | TaxBand | AssessmentStatus     | PublicationStatus |
		|                         | Proposed Effective Date |               |         | Previously Current   | Published         |
		| effective_from_date     | effective_from_date     |               |         | Previously Current   | Published         |
		| Proposed Effective Date |                         |               |         | Current (live entry) | Published         |

	
#-----------------------------------Extra Scenarios Not Considered For Regression-----------------#
#--------------------------------------------------------------------------------------------------#

@Ignore
Scenario: 06. Create Effective Date Change Job E2E using New Data
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'CR03' and creates the Request
	Then User validates the Job creation by clicking on 'Submit Job' from 'Request Action' menu for 'CR03' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates the questionnaire in the 'Researching' BPF pop-up for 'CR03'
	Then User validates and clicks the 'PVT' tab present in the 'Desktop Research Form' tablist
	Then User validates the 'Welcome' message and click on Create Button in 'PADS' tab
	#And User selects the PAD and clicks on 'Edit'
	Then User validates and clicks the 'PAD Entry' tab present in the 'Desktop Research Form' tablist
	Then User validates the fields in Property Attributes section under PAD Entry tab of Researching stage
	And User fills the mandatory fields in Property Attributes section under PAD Entry tab of Researching stage
	And User clicks on the New Value Significant Code Button in General section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Domestic Property VSC Page
	And User clicks on 'Save & Close' on the commandbar
	And User clicks on the New Source Code Button in Source Codes section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Attribute Set Source Code Page
	And User clicks on 'Save & Close' on the commandbar
	And User fills the mandatory fields in PAD Validation section under General tab of Validate PAD stage for 'Individual'
	And User clicks on 'Save' on the commandbar
	Then User validates the 'PAD Validation Outcome' as 'Pass'
	And User clicks on 'Refresh' on the commandbar
	Then User validates 'Undertake Banding' BPF journey as 'Active'
	Then User validates '---' for Is Banding Complete on 'Undertake Banding' BPF journey
	Then User validates and clicks the 'Banding' tab present in the 'Job Form' tablist
	And User clicks on 'Refresh' on the commandbar
	And User fills the mandatory fields in Banding Decision section under Banding tab of Undertake Banding stage for 'Individual'
	And User clicks on 'Refresh' on the commandbar
	Then User validates 'Band' for Is Banding Complete on 'Undertake Banding' BPF journey
	And User clicks on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	Then User validate the Band entered and Publication status as 'Unpublished'
	And User enters the fields on 'Maintain Assessment' BPF Journey pop-up
	Then User validates the status as 'List Updated'
	Then User validates and clicks the 'Details' tab present in the 'Job Form' tablist
	And User captures the below Hereditament Details
		| fieldName       |
		| Building Name   |
		| Sub Building    |
		| Building Number |
		| Street          |
		| Town            |
		| PostCode        |
	And User captures the 'UPRN' from the Address Details screen
	And User appends the 'CR03' data captured in the output sheet
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP

	
@Ignore
Scenario: 7. VMS Integration - Effective Date Change
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditament'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP
	And User clicks on 'Mapping' on the commandbar
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' after VMS is loaded

@Ignore
Scenario: 8. SharePoint Integration - Effective Date Change
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditament'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP
	Then User validates and clicks the 'Documents' tab present in the 'Job Form' tablist
	And User clicks on 'Upload' button and selects 'This Job'
	And User clicks on 'Choose Files' and uploads the document
	And User selects 'BA information' from 'Document Type' dropdown on the Document Dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the upload status message

@Ignore
Scenario: 9. Ask For Help - Effective Date Change
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditament'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP
	And User clicks on 'Ask for Help' on the commandbar
	And User enters details on AskForHelp dialog and Mark as Complete
	And User clicks on 'Save' on the commandbar
	And User navigates to 'Activities' under 'My Work'
	And User filters the View Selector to 'Closed Activities'
	And User filters the 'Subject' column with the 'SubjectText' created
	Then User validates the Activity Status column value as 'Completed' for latest 'Actual End'



@Ignore
Scenario: 10. Raise Inspection - Deletion - BST-81697
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditament'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates the questionnaire in the 'Researching' BPF pop-up for 'CR03'
	Then User validates and clicks the 'Inspection' tab present in the 'Desktop Research Form' tablist
	Then User validates the default values for below fields under 'CT Inspection' section
		| fieldName                                | fieldValue                       |
		| Photos                                   | Inspection                       |
		| Location Plan                            | Obtained/Validated by Researcher |
		| Floor Plan (including layout and access) | Obtained/Validated by Researcher |
		| Measurements                             | Obtained/Validated by Researcher |
		| Details of occupation                    | Obtained/Validated by Researcher |
		| Complete HMO checklist                   | Obtained/Validated by Researcher |
		| Complete boat/mooring checklist          | Obtained/Validated by Researcher |
		| Other- see remarks                       | Obtained/Validated by Researcher |
	And User fills in the mandatory details in the Inspection section
	And User clicks on 'Save' on the commandbar
	Then User validates the Inspection Job created and clicks on it
	Then User validates and clicks the 'Inspection On Site' tab present in the 'Inspection Task Form' tablist
	Then User validates and clicks the 'General' tab present in the 'Inspection Task Form' tablist
	And User selects 'Full' as the Inspection Type and Save & Mark as Complete
	Then User validates the default values for below fields under 'CT Inspection' section
		| fieldName | fieldValue                       |
		| Photos    | Obtained/Validated by Researcher |


@Ignore
Scenario: 11. Correspondence Check - Effective Date Change
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditament'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Effective Date Change'
	And User clicks on 'Save' on the commandbar
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	And User enters the fields on 'Maintain Assessment' BPF Journey pop-up
	Then User validates the status as 'List Updated'
	And user clicks on 'Outbound Correspondence' option from more tabs list
	Then user validates the correspondence link and clicks on it
	Then user validates the PDF generated

@Ignore
Scenario: 12. LA Portal - Effective Date Change
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in to LA Portal
	When I click Single report tab
	Then I choose 'CR09' as the reason code for the submission
	And User enter details on References page
	And User selects 'Band A' for the property on the Select Council Tax Band page
	And User enter details on Contact Details page
	And User enter EFfective Date and Remarks on Change request details page
	And I should be able to see "You have successfully submitted your report to the Valuation Office Agency" message on the screen
	Given User is logged in
	And User navigates to 'Submissions' under 'Service'
	And User filters the 'Channel' column with 'Integration' value
	And User clicks on the latest submission from LA Portal
	Then User validates the field values in Details section under Summary tab
	And User clicks on the Request link containing the Submission ID under Related Requests section
	Then User validates the field values in Remarks section under Summary tab

@Ignore
Scenario: 13. Effective Date Change on Deletion - Backward Date (BST-88146)(Invalid)
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForEDC'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Effective Date Change - Backward' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Effective Date Change' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates and clicks the 'Check Facts' tab present in the 'Desktop Research Form' tablist
	And User enter details and validates linked Assessment in the Check Facts tab at the Researching stage for 'Effective Date Change'
	And User clicks on 'Save' on the commandbar
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Next Stage' for 'Researching' journey on the headerbar
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	And User navigates to 'Proposed Assessments' tab to validate the below components of Assessments
		| EffectiveFrom           | EffectiveTo | CompIndicator | TaxBand | AssessmentStatus     | PublicationStatus |
		| expEffectiveChangedDate |             |               | Deleted | Current (live entry) | Unpublished       |
	And User enters the fields on 'Maintain Assessment' BPF Journey pop-up
	Then User validates the status as 'List Updated'
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	And User navigates to 'History' tab to validate the below components of Assessments
		| EffectiveFrom           | EffectiveTo             | CompIndicator | TaxBand | AssessmentStatus     | PublicationStatus |
		|                         | expEffectiveChangedDate |               |         | Previously Current   | Published         |
		| effective_from_date     | effective_from_date     |               | Deleted | Previously Current   | Published         |
		| expEffectiveChangedDate |                         |               | Deleted | Current (live entry) | Published         |

	#New property
@Ignore
Scenario: 18. Validate Sharepoint Integration for Individual Job
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'CR03' and creates the Request
	Then User validates the Job creation by clicking on 'Submit Job' from 'Request Action' menu for 'CR03' BP
	Then User validates and clicks the 'Documents' tab present in the 'Job Form' tablist
	And User clicks on 'Upload' button and selects 'This Job'
	And User clicks on 'Choose Files' and uploads the document
	And User selects 'BA information' from 'Document Type' dropdown on the Document Dialog
	And User clicks on 'Submit' on the Document Dialog
	Then User validates the upload status message
#****************************Test Not In Scope For Regression*********************

@NewPropDataGenerator @TestDataGenerator
Scenario Outline: 22. Release And Publish without QA/QC Check
	Given I run the scenario <Iterations> times
	And User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'CR03' and creates the Request
	Then User validates the Job creation by clicking on 'Submit Job' from 'Request Action' menu for 'CR03' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates the questionnaire in the 'Researching' BPF pop-up for 'CR03'
	Then User validates and clicks the 'PVT' tab present in the 'Desktop Research Form' tablist
	Then User validates the 'Welcome' message and click on Create Button in 'PADS' tab
	#And User selects the PAD and clicks on 'Edit'
	Then User validates and clicks the 'PAD Entry' tab present in the 'Desktop Research Form' tablist
	Then User validates the fields in Property Attributes section under PAD Entry tab of Researching stage
	And User fills the mandatory fields in Property Attributes section under PAD Entry tab of Researching stage
	And User clicks on the New Value Significant Code Button in General section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Domestic Property VSC Page
	And User clicks on 'Save & Close' on the commandbar
	And User clicks on the New Source Code Button in Source Codes section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Attribute Set Source Code Page
	And User clicks on 'Save & Close' on the commandbar
	And User fills the mandatory fields in PAD Validation section under General tab of Validate PAD stage for 'Individual'
	And User clicks on 'Save' on the commandbar
	Then User validates the 'PAD Validation Outcome' as 'Pass'
	And User clicks on 'Refresh' on the commandbar
	Then User validates 'Undertake Banding' BPF journey as 'Active'
	Then User validates and clicks the 'Banding' tab present in the 'Job Form' tablist
	And User clicks on 'Refresh' on the commandbar
	And User fills the mandatory fields in Banding Decision section under Banding tab of Undertake Banding stage for 'Individual'
	And User clicks on 'Refresh' on the commandbar
	And User clicks on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	Then User validate the Band entered and Publication status as 'Unpublished'
	And User enters the fields on 'Maintain Assessment' BPF Journey pop-up
	Then User validates the status as 'List Updated'
	Then User validates and clicks the 'Details' tab present in the 'Job Form' tablist
	And User captures the below Hereditament Details
		| fieldName       |
		| Building Name   |
		| Sub Building    |
		| Building Number |
		| Street          |
		| Town            |
		| PostCode        |
	And User captures the 'UPRN' from the Address Details screen
	And User appends the 'CR03' data captured in the output sheet

Examples:
	| Iterations |
	| 1          |
	| 2          |
	| 3          |
	| 4          |
	| 5          |
	| 6          |
	| 7          |
	| 8          |
	| 9          |
	| 10         |

@Ignore
Scenario: 20. Validate the VMS loading for Individual Job
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'CR03' and creates the Request
	Then User validates the Job creation by clicking on 'Submit Job' from 'Request Action' menu for 'CR03' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates the questionnaire in the 'Researching' BPF pop-up for 'CR03'
	Then User validates and clicks the 'PVT' tab present in the 'Desktop Research Form' tablist
	Then User validates the 'Welcome' message and click on Create Button in 'PADS' tab
	#And User selects the PAD and clicks on 'Edit'
	Then User validates and clicks the 'PAD Entry' tab present in the 'Desktop Research Form' tablist
	Then User validates the fields in Property Attributes section under PAD Entry tab of Researching stage
	And User fills the mandatory fields in Property Attributes section under PAD Entry tab of Researching stage
	And User clicks on the New Value Significant Code Button in General section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Domestic Property VSC Page
	And User clicks on 'Save & Close' on the commandbar
	And User clicks on the New Source Code Button in Source Codes section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Attribute Set Source Code Page
	And User clicks on 'Save & Close' on the commandbar
	And User fills the mandatory fields in PAD Validation section under General tab of Validate PAD stage for 'Individual'
	And User clicks on 'Save' on the commandbar
	Then User validates the 'PAD Validation Outcome' as 'Pass'
	And User clicks on 'Refresh' on the commandbar
	Then User validates 'Undertake Banding' BPF journey as 'Active'
	Then User validates '---' for Is Banding Complete on 'Undertake Banding' BPF journey
	Then User validates and clicks the 'Banding' tab present in the 'Job Form' tablist
	And User clicks on 'Refresh' on the commandbar
	And User fills the mandatory fields in Banding Decision section under Banding tab of Undertake Banding stage for 'Individual'
	And User clicks on 'Refresh' on the commandbar
	Then User validates 'Band' for Is Banding Complete on 'Undertake Banding' BPF journey
	And User clicks on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	Then User validate the Band entered and Publication status as 'Unpublished'
	And User enters the fields on 'Maintain Assessment' BPF Journey pop-up
	Then User validates the status as 'List Updated'
	Then User validates and clicks the 'Details' tab present in the 'Job Form' tablist
	And User captures the below Hereditament Details
		| fieldName         |
		| Building Name     |
		| Sub Building Name |
		| Building Number   |
		| Street            |
		| Town              |
		| PostCode          |
	And User clicks on 'Mapping' on the commandbar
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' after VMS is loaded

	
@Ignore
Scenario: 21. Validate No Action for Individual Job
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'CR03' and creates the Request
	Then User validates the Job creation by clicking on 'Submit Job' from 'Request Action' menu for 'CR03' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	When User clicks Requests Action dropdown tab on the main Nav
	And User selects No Action dropdown option under Request Action
	And User fills the mandaory fields in the No Action Detail Pop-up
	Then User validates the status as 'No Action'


@Ignore
Scenario: 14. Validates fields in Check Facts Tab in Researching Stage BST-69482
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'New Property - Individual' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'New Property - Individual' BP
	And User navigates to 'Jobs' under 'Service'
	And User filters the View Selector to 'All Jobs'
	And User filters the 'New Property - Individual' job created from the 'Job ID' column
	And User filters the job and assign to himself and opens the job
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates the questionnaire in the 'Researching' BPF pop-up for 'CR03'
	Then User validates the Dekstop Research Questionnaire for 'New Property - Individual'
		| Questions                                                                 |
		| Is the property part of development of 10 or more?                        |
		| Are there plans of the property?                                          |
		| Are more than 1 self-contained units identified?                          |
		| Is this property a care home?                                             |
		| Is the property a HMO?                                                    |
		| Is the property occupied by more than 1 household?                        |
		| Has the new property been built on the curtilage of an existing property? |
		| Has the new property come into existence as a result of a reconstitution? |
		| Has a completion notice been issued?                                      |
		| Was the property previously used for non-domestic purposes?               |

	#Deletion
@Ignore
Scenario: 19. Create Deletion Job E2E using New Data (BST-80779)
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'New Property - Individual' and creates the Request
	Then User validates the Job creation by clicking on 'Submit Job' from 'Request Action' menu for 'New Property - Individual' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	Then User validates the questionnaire in the 'Researching' BPF pop-up for 'CR03'
	Then User validates and clicks the 'PVT' tab present in the 'Desktop Research Form' tablist
	Then User validates the 'Welcome' message and click on Create Button in 'PADS' tab
	Then User validates the fields in Property Attributes section under PAD Entry tab of Researching stage
	And User fills the mandatory fields in Property Attributes section under PAD Entry tab of Researching stage
	And User clicks on the New Source Code Button in Source Codes section under PAD Entry tab of Researching stage
	And User enters the mandatory fields in the General tab of New Attribute Set Source Code Page
	And User clicks on 'Save & Close' on the commandbar
	And User fills the mandatory fields in PAD Validation section under General tab of Validate PAD stage for 'Individual'
	And User clicks on 'Save' on the commandbar
	Then User validates the 'PAD Validation Outcome' as 'Pass'
	And User clicks on 'Save' on the commandbar
	And User clicks on 'Refresh' on the commandbar
	Then User validates 'Undertake Banding' BPF journey as 'Active'
	Then User validates and clicks the 'Banding' tab present in the 'Job Form' tablist
	And User clicks on 'Refresh' on the commandbar
	And User fills the mandatory fields in Banding Decision section under Banding tab of Undertake Banding stage for 'Individual'
	And User clicks on 'Save' on the commandbar
	And User clicks on 'Refresh' on the commandbar
	And User clicks on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	Then User validates and clicks the 'Assessment' tab present in the 'Job Form' tablist
	Then User validate the Band entered and Publication status as 'Unpublished'
	And User enters the fields on 'Maintain Assessment' BPF Journey pop-up
	Then User validates the status as 'List Updated'
	Then User validates and clicks the 'Details' tab present in the 'Job Form' tablist
	And User captures the below Hereditament Details
		| fieldName       |
		| Building Name   |
		| Sub Building    |
		| Building Number |
		| Street          |
		| Town            |
		| PostCode        |
	And User captures the 'UPRN' from the Address Details screen
	And User appends the 'CR03' data captured in the output sheet
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Deletion' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Deletion' BP

	
@Ignore
Scenario: 18. Set Effective Date at DR Level- Deletion (BST-99547)
	Given User uses test data with ID 'TD_002' from 'TestDataPart2' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForDel'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Deletion' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Deletion' BP
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	And User clicks on 'Set Effective Date' on the commandbar
	And User sets the revised effective date as '-4'
	Then User Validate the new Proposed Effective Date Change on Researching Screen

@Ignore
Scenario: 15. LA Portal - Deletion (BST-82524)
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in to LA Portal
	When I click Single report tab
	Then I choose 'CR01' as the reason code for the submission
	And User enter details on References page
	And User selects 'Band A' for the property on the Select Council Tax Band page
	And User enter details on Contact Details page
	And User enter EFfective Date and Remarks on Change request details page
	And I should be able to see "You have successfully submitted your report to the Valuation Office Agency" message on the screen
	Given User is logged in
	And User navigates to 'Submissions' under 'Service'
	And User filters the 'Channel' column with 'Integration' value
	And User clicks on the latest submission from LA Portal
	Then User validates the field values in Details section under Summary tab
	And User clicks on the Request link containing the Submission ID under Related Requests section
	Then User validates the field values in Remarks section under Summary tab

@Ignore
Scenario: 7. Validate No Action at Request Level In Change of Address BST-100601(Invalid/Descoped)
	Given User uses test data with ID 'COA_001' from 'TestDataPart4' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForVOAAddress'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Change of Address' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Change of Address' BP
	And User navigates to 'Jobs' under 'Service'
	And User filters the View Selector to 'All Jobs'
	And User filters the 'Change of Address' job created from the 'Job ID' column
	And User filters the job and assign to himself and opens the job
	And User selects the 'No Action' menu list option from 'Job Actions' Commandbar menu
	And User selects 'CN03 - Duplicate Report' job Type for 'No Action' and clicks on Continue and Finish
	And User click on 'Refresh' button from 'menubar' untill 'Inactive' status display
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display

@Ignore
Scenario: 10. Informal Challenge - Increase the Band of an English Hereditament Via Request - BST-93779(Invalid)
	Given User uses test data with ID 'IFC_002' from 'InformalChallenge' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User connects to the DB and retrieves the data for 'findhereditamentForIFCEng'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Increase the Band of an English Hereditament" case
	And User collapse if site map navigation expanded on left pane
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Informal Challenge' and creates the Request
	Then User Validates New Validity/Acceptance Check by clicking on 'Check CT Challenge' from 'Request Action' menu for 'Informal Challenge' BP
	And User navigates to General tab and updates the Comparable Property Match Results for 'Informal Challenge' BP
	And the user validates the outbound Correspondence validates the 'England' and status as 'sent'
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Informal Challenge' BP
	And User navigates to 'Jobs' under 'Service'
	And User filters the View Selector to 'All Jobs'
	And User filters the 'Informal Challenge' job created from the 'Job ID' column
	And User filters the job and assign to himself and opens the job
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User enter Property Attributes
	And User enter data for 'Floors' field value only when data not entered
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and increased 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Proposed Assessments' button
	Then User asserts below 'Proposed Assessments' details
		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| expEffectiveChangedDate |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'All Jobs Created for Request' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	#And User closes business process stage container
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To            | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| expEffectiveChangedDate |                         | Proposed Tax Band | No            | Current (live entry) | Published         | Alteration       |
		| effective_from_date     | expEffectiveChangedDate | Current Tax Band  | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User closes browser
	Then User validates the field values in Remarks section under Summary tab

#NewEstate

@Ignore
Scenario: 14. To Create the Estate File using the Estate File Job Type - Covers BST-82770
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User creates a New Request through a Submission Form
	And User selects Request Type as 'Council Tax' and Job Type as 'Estate File' and creates the Request
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Estate File' BP
	And User clicks on New Estate File option under Hereditament Details section of Details Tab
	And User fills the mandatory fields in the quick create Estate File pop up
	Then User validates the status as 'New'
	And User clicks on 'Next Stage' for 'Details' journey on the headerbar
	And User enters the Closure Date under 'Close' journey on the headerbar
	And User clicks on 'Finish' for 'Close' journey on the headerbar
	Then User validates the 'Finished' stage on the 'Close' journey on the headerbar

	
@Ignore
Scenario: 15. Raising Inspection under Estate Action for an Estate File- covers BST-81720
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User navigates to 'Estate Files' under 'Estate Management'
	And User clicks on 'New' on the commandbar
	And User clicks on the 'General' tab present in the 'Estate File Form' tablist
	And User fills the mandatory fields in the General tab of the Estate File form
	And User clicks on 'Save' on the commandbar
	And User captures the CreatedOn field
	And User clicks on the 'Estate Actions' tab present in the 'Estate File Form' tablist
	And User clicks on the New Estate Action Button in the Estate Actions Tab
	And User enters the mandatory fields on the Estate Action Pop-up to raise an Inspection
	Then User validate the Estate Action Type Created
	And User clicks on the 'Inspections' tab present in the 'Estate File Form' tablist
	Then User validate and click the Inspection Created
	Then User validate the Inpections data in the General Section of General Tab

	
@Ignore
Scenario: 16. House Type Banding has access to CTBT tool - covers BST-82287
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User navigates to 'Estate Files' under 'Estate Management'
	And User clicks on 'New' on the commandbar
	And User clicks on the 'General' tab present in the 'Estate File Form' tablist
	And User fills the mandatory fields in the General tab of the Estate File form
	And User clicks on 'Save' on the commandbar
	And User captures the CreatedOn field
	And User clicks on the 'Estate Actions' tab present in the 'Estate File Form' tablist
	And User clicks on the New Estate Action Button in the Estate Actions Tab
	And User enters the mandatory fields on the Estate Action Pop-up
	Then User validate the Estate Action Type Created
	And User clicks on the 'House Types' tab present in the 'Estate File Form' tablist
	Then User validate the House Type Created and click on it
	And User fills the mandatory fields in PAD Code Details section under General tab of Validate PAD stage
	And User fills the mandatory fields in PAD Validation section under General tab of Validate PAD stage for 'Estate'
	And User clicks on 'Save' on the commandbar
	Then User validates the text present as 'Pass' for 'PAD Validation Outcome'
	And User clicks on 'Next Stage' for 'Validate PAD' journey on the headerbar
	Then User validates and clicks the 'Banding' tab present in the 'House Type Form' tablist
	Then User validates the fields present in Subject Attributes section under Banding tab of Banding BPF
	And User clicks on New Comparable Property Sets Button to validate CTBT Integration
	Then User should validate the VMS title as 'VMS - Valuation Mapping System' after CTBT is loaded

	
@Ignore
Scenario: 17. Create Plots and validate Billing Authority on Plot Manager- covers BST-81235
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User navigates to 'Estate Files' under 'Estate Management'
	And User clicks on 'New' on the commandbar
	And User clicks on the 'General' tab present in the 'Estate File Form' tablist
	And User fills the mandatory fields in the General tab of the Estate File form
	And User clicks on 'Save' on the commandbar
	And User captures the CreatedOn field
	And User clicks on the 'Estate Actions' tab present in the 'Estate File Form' tablist
	And User clicks on the New Estate Action Button in the Estate Actions Tab
	And User enters the mandatory fields on the Estate Action Pop-up
	Then User validate the Estate Action Type Created
	Then User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	#And User clicks on the 'Estate Actions' tab present in the 'Estate File Form' tablist
	#And User clicks on the New Estate Action Button in the Estate Actions Tab
	#And User enters the mandatory fields on the Estate Action Pop-up
	#And User validate duplicate plot error message in the dialog and click ok
	#And User validates and clicks the 'Plot Manager' tab present in the 'Estate File Form' tablist
	And User displays all the columns for the plots available
	Then User validates Plot Billing Authority and enter Floor level for Plots

	
@Ignore
Scenario: 18. Update the Estate File using the Estate File Job Type - Covers BST-82772
	Given User uses test data with ID 'TD_001' from 'TestDataPart2' sheet
	And User is logged in
	And User navigates to 'Estate Files' under 'Estate Management'
	And User clicks on 'New' on the commandbar
	And User clicks on the 'General' tab present in the 'Estate File Form' tablist
	And User fills the mandatory fields in the General tab of the Estate File form
	And User clicks on 'Save' on the commandbar
	And User captures the CreatedOn field
	And User navigates to 'Submissions' under 'Service'
	And User clicks on 'New' on the commandbar
	And User fills the mandatory details on the Summary Tab of Submission Form
	And User clicks on 'Save' on the commandbar
	And User selects 'New Request' from the overflow command options under Related Requests
	And User fills the mandaory fields in the Categorisation section under Summary tab of Request Form
	And User fills the mandaory fields in the Details section under Summary tab of Request Form
	And User clicks on 'Save' on the commandbar
	When User selects 'Validate Request' option from the Request Action dropdown
	And User clicks on the Save & Close button on the Dialog to Validate Request
	Given User clicks on 'Go back' button
	Then User validates and clicks the 'Related' tab present in the 'Request Form' tablist
	And the user selects 'Child Jobs' option under Related Tab
	And User clicks on the new Estate Job Created
	And User selects the Estate file created under Hereditament Details section of Details Tab
	Then User validates the Estate File Name after selecting the Estate File for update

#02/11/2026
@ignore
Scenario:05. Verify CT to NDR Borderline Job can be raised as an alternate Job on a deletion Job  - Deletion
	Given User uses test data with ID 'TD_004' from 'Deletion' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforDeletion_Bolton'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Alternate Job CT to NDR Borderline Process" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User looked for 'CT Payer' field value
	And User entered 0 days before date for 'Date Received' field value
	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	#And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicks on 'Raise Alternate Job' under 'Job Actions'
	And User selects 'Borderline CT to NDR' job Type for the alternate Job
	And User clicks on OK Button on Leave this Page dialog
	And User closes browser

	@Ignore
Scenario: 13. BST-80551_Alteration CR07 Material Reduction-Verify that no action can be performed on a CR07 Alternate job raised
	Given User uses test data with ID 'DL_001' from 'TestDataPart3' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in to Dynamics application to work for "BST-80551_NoAction_CR07AlternateJob" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'CT Payer' and selects '1' option value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicks on 'Raise Alternate Job' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'MR_001'
	And User clicked on 'Save and Close' button on new UI
	#And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	#And User looked for 'Data Source Role' field value only when data not entered
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User closes browser



@Ignore
Scenario: 15. BST-80563_CR07 Material Reduction-Desktop research job and raise supplementary job linked to original request
	Given User uses test data with ID 'MR_001' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in to Dynamics application to work for "BST-80539_CR07" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results
	And User selects '1' row from search Hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Parent_MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears

	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value
	And User clicks on 'Linked to Originating Request?' dropdown and select 'Yes' value
	And User clicked on 1 position 'Find Hereditament' button
	And User enters data in "Postcode" field
	And User clicked on 2 position 'Search' button
	And User selects '2' row from search Hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User entered 25 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	Then user asserts associated jobs row count '2' by "Refresh" grid
	And User click on 'Requests' under 'Service' section
	And User opens 'Parent_MR_Request' 'Name' through 'CT Requests'
	And User navigates to filtered request
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User closes browser

@Ignore
Scenario: 16. BST-80564[SIT]-CT - Alteration - CR07 Material Reduction-Desktop research job and raise supplementary job NOT linked to original request
	Given User uses test data with ID 'MR_001' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| town      |
		| postcode  |
		| uprn      |
	And User is logged in to Dynamics application to work for "supplementary_job_NOT_linked" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	#And User 'Assign' job to self on 'Assign to Team or User' pop-up
	#And user waits till loading spinner disappears
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value
	And User clicks on 'Linked to Originating Request?' dropdown and select 'No' value
	And User clicked on 1 position 'Find Hereditament' button
	And User enters data in "Postcode" field
	And User clicked on 2 position 'Search' button
	And User selects '2' row from search Hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User entered 25 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And User closes dialog if still present
	#And User click on job link in Header
	And User clicked on 'Details' BPF Journey button
	And User closes business process stage container
	#And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User click on 'Related Jobs' tab on dialog from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	Then user asserts related jobs row count '1'
	And User closes browser

	@Ignore
Scenario: 21.BST-135797_[SIT] E2E Welsh Reform Proposals -[WAR-491]-Validate No action will be linked to parent request if one of the supplementary job is No Actioned
	Given User uses test data with ID 'MR_003' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_WestLancashire'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "MR_E2E_80581" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User scroll to 'Planning Details' element
	And User enter data for 'Reason for Portal Reference Omission' text area field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'CPC_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'EDC' for 'EDC_003'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get all Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User opens 'MR_Request' 'Name' through 'CT Requests'
	And User navigates to filtered request
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '3' by "Refresh" grid
	And user waits till app progress indicator disappears
	And User capture all 3 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Composite Property Change' 'Job Name' supplementory through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Have Associated Material Increase Requests (i.e. CR10s) been taken into consideration?' toggle button
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Material Reduction' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Effective Date Change' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Composite Property Change' job under Associated jobs
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Have Associated Material Increase Requests (i.e. CR10s) been taken into consideration?' toggle button
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Material Reduction' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Effective Date Change' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Composite Property Change' job under Associated jobs
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Have Associated Material Increase Requests (i.e. CR10s) been taken into consideration?' toggle button
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Material Reduction' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Effective Date Change' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display

	@Ignore
Scenario: 02. CR06 Composite Dwelling - Desktop Research - See CR10s linked to CT Composite Change Job - up to Proposed Effective Date BST-82161
	Given User uses test data with ID 'CPC_008' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Croydon'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Composite Dwelling property with Material Increase Backward Date" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'CompositeDwelling' for 'CPC_009'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '0' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Composite Property Change' BP
	And User navigates to 'Jobs' under 'Service'
	And User filters the View Selector to 'All Jobs'
	And User filters the 'Composite Property Change' job created from the 'Job ID' column
	And User filters the job and assign to himself and opens the job
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	When And user selects the 'CompositeChangeTypeDropdown' with any dropdown value
	Given User clicks on 'Save' on the commandbar
	Then User validates and clicks the 'Related CR10s After Effective Date' tab present in the 'Desktop Research Form' tablist
	Then User validates the 'On Hold' value on the Status Reason Column on the Related CR tab
	

	@ignore
Scenario: 10. LA Portal No Action - Composite Dwelling - No Action - BST-81520
	Given User uses test data with ID 'CPC_007' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Croydon'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "LA Portal No Action on CDP" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	#And User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	When And user selects the 'CompositeChangeTypeDropdown' with any dropdown value
	Given User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'No Action' under 'Request Action'
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

	#@NewProperty @SIT @P2 @Regression @UAT_Smoke @SIT_Smoke
#Scenario: 15. CTPRELMGMT-1637_CTBT Integration For Individual
#	Given User uses test data with ID 'NP_024' from 'NewProperty' sheet
#	And User is logged in to Dynamics application to work for "NewProp_CTBT_Integration" case
#	And User collapse if site map navigation expanded on left pane
#	And User click on 'Requests' under 'Service' section
#	And User click on 'New' button from 'menubar'
#	And User looked for 'Job Type' field value
#	And User looked for 'Submitted By' field value
#	And User entered 0 days before date for 'Date Received' field value
#	And User entered 25 days before date for 'Proposed Effective Date' field value
#	And User scroll to 'Billing Authority Link' element
#	And User looked for 'Data Source Role' field value
#	And User clicks on 'Channel' dropdown and select 'Email' value
#	And User enter data for 'BA Report Number' field value
#	And User enter data for 'Reason For Validation' field value
#	And User scroll to 'New Hereditament Details' element
#	And User click on 'Find Address' button
#	#And user enters data in "Postcode" and selects unique address for new property with db data
#	#And user enters data in "Postcode" and selects unique address for new property
#	And user enters data in "Postcode" and selects unique address in 'scenarioContext'
#	And User scroll to 'Billing Authority Link' element
#	And User enter random number for 'Proposed BA Reference Number' field value
#	And User scroll to 'Billing Authority Link' element
#	And user waits till progress indicator disappears
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicks on 'Validate Request' under 'Request Action'
#	And User clicks on 'Proceed' button on 'Confirm' dialog
#	And user waits till progress indicator disappears
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on 'Related Jobs' tab from 'Request Form'
#	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
#	#Given User click on 'Queues' under 'Service' section
#	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
#	And User click on 'Jobs' under 'Service' section
#	And User 'Assign' 'Job Name' through 'All Jobs'
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on "Job Id" element
#	And User waits till 'Details' stage selected
#	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
#	And User waits till 'Researching' stage selected
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'PVT' tab under 'Desktop Research Form'
#	And User clicked on 'Create' button
#	And User waits till ProgressRing disappears
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User looked for value '19 - Houses and Bungalows built between 1908 and 1930' in 'Group' field
#	And User looked for value 'BD - Detached bungalow' in 'Type' field
#	And User looked for value 'B - 1900 - 1918' in 'Age Code' field
#	And User enter data for 'Area' field value
#	And User enter data for 'Rooms' field value
#	And User enter data for 'Bedrooms' field value
#	And User enter data for 'Bathrooms' field value
#	And User enter data for 'Floors' field value
#	And User enter data for 'Level' field value
#	And User looked for value 'N - No Conservatory' in 'Conservatory Type' field
#	And User looked for value 'G1 - Garaging' in 'Parking' field
#	#And User looked for 'Conservatory Type' field value only when data not entered
#	#And User looked for 'Parking' field value by clicking on search icon
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Add New Source Code' button
#	And User looked for 'Source Code' field value
#	And User enter data for 'Comment' field value
#	And User click on 'Save & Close' button from 'menubar'
#	#And user waits till app progress indicator disappears
#	And User scroll to 'PAD Validation' element
#	And User click on 'Validate PAD Code' toggle button
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User validate value 'Pass' for 'PAD Validation Outcome' field
#	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
#	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
#	And User waits till 'Undertake Banding' stage selected
#	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
#	And User clicked on 'Banding' tab under 'Job Form'
#	And User clicked on 'New Comparable Property Set' button
#	And User should validate the VMS title as 'VMS - Valuation Mapping System' after CTBT is loaded
#	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
#	And User looked for 'Proposed Tax Band' single character field value
#	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
#	And User waits till 'Maintain Assessment' stage selected
#	And User closes business process stage container
#	And User clicked on 'Assessment' tab under 'Job Form'
#	And User waits till ProgressRing disappears
#	And User switchs to Assessment frame
#	And User clicked on 'Created Assessments' button
#	And User asserts below 'Created Assessments' details
#		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | New              |
#	And User switchs to deafult frame
#	And User clicked on 'Maintain Assessment' BPF Journey button
#	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Yes' button on 'Complete Job' dialog
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
#	And User clicked on 'Details' tab under 'Job Form'
#	And User click on 'Request' link
#	And User clicks on 'Release and Publish' under 'Request Action'
#	And User clicks on 'OK' button element
#	And User closes dialog if still present
#	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
#	And User clicked on 'Assessment' tab under 'Job Form'
#	And User switchs to Assessment frame
#	And User clicked on 'History' button
#	And User asserts below 'History' details
#		| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Published         | New              |
#	And User switchs to deafult frame
#	And User clicked on 'PVT' tab under 'Job Form'
#	And User validate 'Assessments' details under 'PVT' tab
#		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
#		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |              | No              | Insertion        | No            | Job Name |
#	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
#	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
#	And User click on correspondence "Job Id" element
#	And User clicks on 'Status Reason' dropdown and select 'Ready' value
#	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
#	And User selected 'Integration Messages' under 'Related' tab
#	And User click on messages "Job Id" element
#	And User captures 'Message' text area field in 'featureContext'
#	And User closes browser

@Ignore 
Scenario: 5.SIT_Change of Address - No Action the Request when The address they are asking for it to be changed to matches exactly what we have in the CT List BST-100601
	Given User uses test data with ID 'COA_011' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForVOAAddress'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "No Action in Change of Address" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	#And User scroll to 'Change of Address' element
	#And user select the 'find address' for change of address
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User clicks on 'No Action' under 'Request Action'
	And user waits till app progress indicator disappears
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

	
@Ignore
Scenario: 04. Validate Supplementary Job In Desktop Research Composite Dwelling Property - BST-82164
	Given User uses test data with ID 'CPC_001' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Croydon'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Supplementary Job for CDP" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	#And User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	When And user selects the 'CompositeChangeTypeDropdown' with any dropdown value
	Given User click on 'Save' button from 'menubar'
	Then User creates new 'Proposal' Supplementary job under 'Council Tax'

	@Ignore
Scenario: CPC_02. CR06 Composite Dwelling - Desktop Research - See CR10s linked to CT Composite Change Job - up to Proposed Effective Date BST-82161
	Given User uses test data with ID 'CPC_008' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Croydon'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "Composite Dwelling property with Material Increase Backward Date" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'CompositeDwelling' for 'CPC_009'
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '0' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	Then User validates the Job creation by clicking on 'Validate Request' from 'Request Action' menu for 'Composite Property Change' BP
	And User navigates to 'Jobs' under 'Service'
	And User filters the View Selector to 'All Jobs'
	And User filters the 'Composite Property Change' job created from the 'Job ID' column
	And User filters the job and assign to himself and opens the job
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	When And user selects the 'CompositeChangeTypeDropdown' with any dropdown value
	Given User clicks on 'Save' on the commandbar
	Then User validates and clicks the 'Related CR10s After Effective Date' tab present in the 'Desktop Research Form' tablist
	Then User validates the 'On Hold' value on the Status Reason Column on the Related CR tab

	@Ignore 
Scenario: 6. SIT_Change of Address - No Action the Request when The address they are asking for it to be changed to matches exactly what we have in the CT List BST-100601
	Given User uses test data with ID 'COA_011' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the data for 'findhereditamentForVOAAddress'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	Given User is logged in to Dynamics application to work for "No Action in Change of Address" case
	And User collapse if site map navigation expanded on left pane
	Given User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	#And User scroll to 'Change of Address' element
	#And user select the 'find address' for change of address
	And User click on 'Save' button from 'menubar'
	And User waits till record gets 'Saved'
	And User clicks on 'No Action' under 'Request Action'
	And user waits till app progress indicator disappears
	And User looked for value 'Duplicate Report' in 'No Action Code' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser

	@ignore
Scenario: 03. Raise Alternate Job  BST-81733
	Given User uses test data with ID 'CPC_001' from 'CompositeDwelling' sheet
	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_Croydon'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User is logged in to Dynamics application to work for "ALternate Job for CDP" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	#And User enters data in "Town/City" field
	And User enters data in "Postcode" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate 'Validating' status of 'Request'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	#And User validate 'In Progress' status of 'Request'
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	When And user selects the 'CompositeChangeTypeDropdown' with any dropdown value
	Given User clicks on 'Save' on the commandbar
	And User selects the 'Raise Alternate Job' menu list option from 'Job Actions' Commandbar menu
	And User selects 'Material Reduction' job Type for the alternate Job
	And User clicked on 'Save and Close' button on new UI
	And User clicks on OK Button on Leave this Page dialog
	And user waits till 'Saving...' 'progressbar' disappears
	#When User clicks on the Save & Close button on the Dialog to Validate Request
	#And User validates the new Job is created which is not equal to old Job ID for 'Composite Property Change'

	@ignore
Scenario: 18.BST-93020_E2E-CT Proposals-Wales- Scenario 1 - Verify Proposal is deemed to be INVALID (Invalidity discovered within 28 days)- NO disagreement received
	Given User uses test data with ID 'Proposals_Wales_004' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Wales_InValidProposals_disagreement" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
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
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User clicked on 2 position 'Find Hereditament' button
	And User enters data in "Town/City" field
	And User enters data in "Postcode" field
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

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered
	And User enter 'Time of Date Received' as '24' mins before current time



	#And User clicks on 'Channel' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'No' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Invalid' in 'Validity/Acceptance Decision' field
	And User entered 0 days before date for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	#And User enter 'Time of Validity/Acceptance Decision Date' as '1' mins after current time
	And User enter data for 'Remarks / Thought Process' text area field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is CR15 Required?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	Then user validated 'Is there enough evidence to raise an Informal Challenge? If so, raise a new Request. If this is required use the Supplementary Job Requisition to raise the Request,Send non system generated correspondence Invalid Proposal Wales VO7735' text
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And user waits till app progress indicator disappears

	#And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	#And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save & Close' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	#And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User click on 'Refresh' button from 'menubar' untill 'Withdrawn' status display
	And User closes browser


@ignore
Scenario: 17.BST-93056_E2E-CT Proposals-Wales-Verify Proposal is deemed to be INVALID- disagreement received- still invalid within 28 days of registration.
	Given User uses test data with ID 'Proposals_Wales_005' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Wales_InValidProposals_disagreement" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
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
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	And User clicked on 2 position 'Find Hereditament' button
	And User enters data in "Town/City" field
	And User enters data in "Postcode" field
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

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	And User entered 2 days before from calender for 'VT Decision Date' field value on 'dialog'

	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'No' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '2' option value
	And User looked for 'Interested Party Request Property Link' and selects '1' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	#And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	#And User looked for value 'Invalid' in 'Validity/Acceptance Decision' field
	#And User entered data for 'Validity/Acceptance Decision Date' field value on dialog
	#And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	#And User click on 'Save' button from 'dialog'
	#And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Is CR15 Required?' dropdown and select 'Yes' value
	And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	Then user validated 'Is there enough evidence to raise an Informal Challenge? If so, raise a new Request. If this is required use the Supplementary Job Requisition to raise the Request,Send non system generated correspondence Invalid Proposal Wales VO7735' text
	And User clicks on 'OK' button element
	Then User validate 'Invalid' value for 'Validity/Acceptance Decision' field
	#And User closes dialog if still present
	#And user waits for '5' secs
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link

	#05/03/2026
	#@CompositeDwelling @SIT @P2 @Regression @mini_Regression
#Scenario: CPC02_CTPRELMGMT-1614_CTPRELMGMT-1600_E2E_CL28 Previously Composite Now Wholly Domestic - Validate Release And Publish without QA/QC Check for CompositePropertyChange Business Process 
#	Given User uses test data with ID 'CPC_012' from 'CompositeDwelling' sheet
#	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_runnymede'
#		| fieldName           |
#		| town                |
#		| postcode            |
#		| uprn                |
#		| effective_from_date |
#	And User is logged in to Dynamics application to work for "Previously Composite Now Wholly Domestic" case
	#And User collapse if site map navigation expanded on left pane
	#And User click on 'Requests' under 'Service' section
	#And User click on 'New' button from 'menubar'
	#And User looked for 'Job Type' field value
	#And User looked for 'Submitted By' field value
	#And User entered 0 days before date for 'Date Received' field value
	##And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
	##And User entered 25 days before date for 'Proposed Effective Date' field value
	#And User looked for 'Data Source Role' field value
	#And User clicks on 'Channel' dropdown and select 'Email' value
	#And User enter data for 'BA Report Number' field value
	#And User enter data for 'Reason For Validation' field value
	#And User click on 'Find Hereditament' button
	##And User enters data in "Town/City" field
	#And User enters data in "Postcode" field
	#And User clicked on 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results
	#And User clicked on 'Select' button
	#And User waits till Find Hereditament dialog disappears
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User waits till record gets 'Saved'
	#And User clicks on 'Validate Request' under 'Request Action'
	#And User click on 'Save & Close' button from 'dialog'
	#And User waits till 'dialog' disappears
	#And User click on 'Related Jobs' tab from 'Request Form'
	#And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#And User click on 'Jobs' under 'Service' section
	#And User 'Assign' 'Job Name' through 'All Jobs'
	##And User 'Assign' 'Job ID' through 'All Jobs'
	#And user waits till progress indicator disappears
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User click on "Job Id" element
	#And User waits till 'Details' stage selected
	#And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	#And User waits till 'Researching' stage selected
	#And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	#And User clicks on 'Composite Change Type' dropdown and select 'Previously Composite Now Wholly Domestic' value
	#And User enter data for 'Related Composite Property' field value
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicked on 'PVT' tab under 'Desktop Research Form'
	#And User selects 'Committed' record
	#And User get PAD attributes of 'Committed' record
	#And User clicked on 'Amend' button
	#And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	#And user waits till app progress indicator disappears
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	#And user waits till app progress indicator disappears
	#And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User waits till record gets 'Saved'
	#And User enter Property Attributes
	#And User enter data for 'Floors' field value only when data not entered
	#And User looked for 'Conservatory Type' field value only when data not entered
	#And User enter data for 'Conservatory Area' field value only when data not entered
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicked on 'Add New Source Code' button
	#And User looked for 'Source Code' field value
	#And User enter data for 'Comment' field value
	#And User click on 'Save & Close' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User scroll to 'PAD Validation' element
	#And User click on 'Validate PAD Code' toggle button
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User validate value 'Pass' for 'PAD Validation Outcome' field
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	#And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	#And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	#And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	#And User waits till 'Undertake Banding' stage selected
	#And User closes business process stage container
	#And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	#And User clicked on 'Banding' tab under 'Job Form'
	#And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	#And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	#And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	#And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	#And User waits till 'Maintain Assessment' stage selected
	#And User clicked on 'Assessment' tab under 'Job Form'
	#And User waits till ProgressRing disappears
	#And User switchs to Assessment frame
	#And User clicked on 'Created Assessments' button
	#And User asserts below 'Created Assessments' details
	#	| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	#	| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | Alteration       |
	#And User switchs to deafult frame
	#And User clicked on 'Maintain Assessment' BPF Journey button
	#And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	#And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	#And User clicks on 'Yes' button on 'Complete Job' dialog
	#And user waits till progress indicator disappears
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	#And User clicked on 'Details' tab under 'Job Form'
	#And User click on 'Request' link
	#And User clicks on 'Release and Publish' under 'Request Action'
	#And User clicks on 'OK' button element
	#And User closes dialog if still present
	#And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	#And User clicked on 'Assessment' tab under 'Job Form'
	#And User switchs to Assessment frame
	#And User clicked on 'History' button
	#And User asserts below 'History' details
	#	| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	#	| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         | Alteration       |
	#	| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
	#And User switchs to deafult frame
	#And User clicked on 'Outbound Correspondence' tab under 'Job Form'
	#And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	#And User click on correspondence "Job Id" element
	#And User clicks on 'Status Reason' dropdown and select 'Ready' value
	#And User clicks on 'OK' button on 'Outbound Correspondence' dialog
	#And User click on 'Save' button from 'menubar'
	#And user waits till 'Saving...' 'progressbar' disappears
	#And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
	#And User selected 'Integration Messages' under 'Related' tab
	#And User click on messages "Job Id" element
	#And User captures 'Message' text area field in 'featureContext'
	#And User validates 'Quadient Message' contains 'CL28' data
	#And User closes browser

	#@CompositeDwelling @E2E @P1_A @Regression
#Scenario: CPC05_CTPRELMGMT-1613_E2E-CL21 (Now Composite) -Validate the change code CL21 (Now Composite) -CR06 Report through LA Portal
#	Given User uses test data with ID 'CPC_013' from 'CompositeDwelling' sheet
#	And User connects to the DB and retrieves the data for 'FindHereditamentforCDP_chorley'
#		| fieldName           |
#		| uprn                |
#		| effective_from_date |
#	And User is logged in to Dynamics application to work for "CL21 (Now Composite)" case
#	And User collapse if site map navigation expanded on left pane
#	And User click on 'Requests' under 'Service' section
#	And User click on 'New' button from 'menubar'
#	And User looked for 'Job Type' field value
#	And User looked for 'Submitted By' field value
#	#And User looked for 'Job Type' field value
#	And User entered 0 days before date for 'Date Received' field value
#	#And User enters '2' days before hereditament 'effective_from_date' for 'Proposed Effective Date' field value
#	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
#	#And User entered 25 days before date for 'Proposed Effective Date' field value
#	And User looked for 'Data Source Role' field value
#	And User clicks on 'Channel' dropdown and select 'Email' value
#	And User enter data for 'BA Report Number' field value
#	And User enter data for 'Reason For Validation' field value
#	And User click on 'Find Hereditament' button
#	And User select 'UPRN' value from 'Search By' dropdown
#	And User enters data in "UPRN" field
#	And User clicked on 'Search' button
#	And User slects spcific 'uprn' row from search hereditament results
#	And User clicked on 'Select' button
#	And User waits till Find Hereditament dialog disappears
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicks on 'Validate Request' under 'Request Action'
#	And User click on 'Save & Close' button from 'dialog'
#	And User waits till 'dialog' disappears
#	And User click on 'Related Jobs' tab from 'Request Form'
#	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
#	And User click on 'Jobs' under 'Service' section
#	And User 'Assign' 'Job Name' through 'All Jobs'
#	#And User 'Assign' 'Job ID' through 'All Jobs'
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on "Job Id" element
#	And User waits till 'Details' stage selected
#	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
#	And User waits till 'Researching' stage selected
#	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
#	And User scroll to 'Correspondence Address' element	
#	And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
#	And User enter data for 'Related Composite Property' field value
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'PVT' tab under 'Desktop Research Form'
#	And User selects 'Committed' record
#	And User get PAD attributes of 'Committed' record
#	And User clicked on 'Amend' button
#	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
#	And user waits till app progress indicator disappears
#	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
#	And user waits till app progress indicator disappears
#	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User enter Property Attributes
#	And User enter data for 'Floors' field value only when data not entered
#	And User looked for 'Conservatory Type' field value only when data not entered
#	And User enter data for 'Conservatory Area' field value only when data not entered
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Add New Source Code' button
#	And User looked for 'Source Code' field value
#	And User enter data for 'Comment' field value
#	And User click on 'Save & Close' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User scroll to 'PAD Validation' element
#	And User click on 'Validate PAD Code' toggle button
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User validate value 'Pass' for 'PAD Validation Outcome' field
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
#	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
#	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
#	And User waits till 'Undertake Banding' stage selected
#	And User closes business process stage container
#	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
#	And User clicked on 'Banding' tab under 'Job Form'
#	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
#	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
#	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
#	And User waits till 'Maintain Assessment' stage selected
#	And User clicked on 'Assessment' tab under 'Job Form'
#	And User waits till ProgressRing disappears
#	And User switchs to Assessment frame
#	And User clicked on 'Created Assessments' button
#	And User asserts below 'Created Assessments' details
#		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |              |         | Yes           | Current (live entry) | Unpublished       | Alteration       |
#	And User switchs to deafult frame
#	And User clicked on 'Maintain Assessment' BPF Journey button
#	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
#	And User clicks on 'Yes' button on 'Complete Job' dialog
#	And user waits till progress indicator disappears
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
#	And User clicked on 'Details' tab under 'Job Form'
#	And User click on 'Request' link
#	And User clicks on 'Release and Publish' under 'Request Action'
#	And User clicks on 'OK' button element
#	And User closes dialog if still present
#	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
#	And User clicked on 'Assessment' tab under 'Job Form'
#	And User switchs to Assessment frame
#	And User clicked on 'History' button
#	And User asserts below 'History' details
#		| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
#		| Proposed Effective Date |                         |         | Yes           | Current (live entry) | Published         | Alteration       |
#		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
#	And User switchs to deafult frame
#	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
#	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
#	And User click on correspondence "Job Id" element
#	And User clicks on 'Status Reason' dropdown and select 'Ready' value
#	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
#	And User click on 'Save' button from 'menubar'
#	And user waits till 'Saving...' 'progressbar' disappears
#	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
#	And User selected 'Integration Messages' under 'Related' tab
#	And User click on messages "Job Id" element
#	And User captures 'Message' text area field in 'featureContext'
#	And User validates 'Quadient Message' contains '(Composite)' data
#	And User validates 'Quadient Message' contains 'CL21' data
#	And User closes browser

#Proposals
@Ignore
Scenario: 16.BST-120131_AD02 + Composite Property -Wales - Validate the change in list- AD02 with Composite Property when Proposal is Valid
	Given User uses test data with ID 'Proposals_Wales_003' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Wales_Proposals_AD02_CPC_Agreed" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| town                |
		| postcode            |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
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
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered


	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'CPC_001'
	And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
	And User enter data for 'Related Composite Property' field value from 'CompositeDwelling' for 'CPC_001'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
	And User waits till 'Maintain Assessment' stage selected
	#And User closes business process stage container
	#And User switchs to Assessment frame
	#And User clicked on 'Created Assessments' button
	#And User asserts below 'Created Assessments' details
	#	| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	#	| Proposed Effective Date |              | Proposed Tax Band | No            | Current (live entry) | Unpublished       | Alteration       |
	#And User switchs to deafult frame
	#And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'Agreed' in 'Settlement Decision' field with keyboard
	Then user validated 'No valid correspondence criteria met, no correspondence has been generated.' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Composite Property Change' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User closes browser

@Ignore
Scenario:NA12_BST-120136_AD01 + Proposal or Appeal Alteration- Wales - Validate the No change in list- AD01 - new Taxpayer with proposal or Appeal Alteration
	Given User uses test data with ID 'Proposals_008' from 'Proposals' sheet
	And User is logged in to Dynamics application to work for "E2E_Wales_NoChangeProposals_POA" case
	And User collapse if site map navigation expanded on left pane
	And User connects to the DB and retrieves the data for 'findHereditament_CArdiff'
		| fieldName           |
		| uprn                |
		| effective_from_date |
	And User click on 'Customer Enquiries' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for value 'Test Customer' in 'Customer' field
	And User looked for 'Customer Relationship Role' field value
	And User entered 40 days before date for 'Date Received in VOA' field value
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
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	#And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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

	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	#And User looked for 'Job Type To Support Basis' field value
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Override System Decision' dropdown and select 'Yes' value
	And User looked for value 'Valid' in 'Validity/Acceptance Decision' field
	And User entered 20 days before date from calender for 'Validity/Acceptance Decision Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks 2 position 'OK' button on 'Leave this page?' dialog
	#And User looked for value 'Not all information necessary for a valid proposal' in 'Validity/Acceptance Decision Reason' field
	#And User modifies value 'Valid' in 'Validity/Acceptance Decision' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7851' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	#And User entered 2 days after hereditament 'effective_from_date' for  from calender for 'Proposed Effective Date' field value on 'dialog'
	#And User enters same date as 'Proposed Effective Date' for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'PVT' tab under 'Desktop Research Form'
	And User selects 'Committed' record
	And User get PAD attributes of 'Committed' record
	And User clicked on 'Amend' button
	And User clicks on 'Continue' button on 'Clone and Amend PADs?' dialog
	And user waits till app progress indicator disappears
	And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And user waits till app progress indicator disappears
	And User clicked on 'PAD Entry' tab under 'Desktop Research Form'
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User enter Property Attributes
	And User looked for 'Conservatory Type' field value only when data not entered
	And User enter data for 'Conservatory Area' field value only when data not entered
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User waits till record gets 'Saved'
	And User clicked on 'Add New Source Code' button
	And User looked for 'Source Code' field value
	And User enter data for 'Comment' field value
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User scroll to 'PAD Validation' element
	And User click on 'Validate PAD Code' toggle button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Pass' for 'PAD Validation Outcome' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
	#And User clicked on 'Undertake Banding' BPF Journey button
	And User closes business process stage container
	And User click on 'Refresh' button from 'menubar' untill 'Banding' tab display
	And User clicked on 'Banding' tab under 'Job Form'
	And User enter data for Caseworker Conclusions / Remarks / Thought Process field
	And User looked for 'Proposed Tax Band' and reduced 0 step from "Current Tax Band" band value
	And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
	And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending No Action' status display
	
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Challenge Process Details' tab under 'Desktop Research Form'
	And User looked for value 'No Change' in 'Settlement Decision' field with keyboard
	#And user validated 'Send non system generated correspondence,Well Founded VO7736' text
	And User clicks on 'OK' button element
	And User entered 1 days before date for 'Settlement Decision Date' field value
	And User clicks on 'Preferred Method Of Communication' dropdown and select 'Email' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar'
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And user waits till app progress indicator disappears
	And User clicked on 'Researching' BPF Journey button
	And User closes business process stage container
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on job link in Header
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status display
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Assessments' details under 'PVT' tab
		| AssessmentStatus     | TaxBand           | Effective_From          | Effective_To            | DOLU_Identifier | ListUpdateAction | CompIndicator | Job      |
		| Current (live entry) | Proposed Tax Band | Proposed Effective Date |                         | No              | Amendment        | No            | Job Name |
		| Previously Current   | Current Tax Band  | effective_from_date     | Proposed Effective Date | No              | New              | No            |          |
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal Or Appeal Alteration' job under Associated jobs
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User closes browser


@Ignore
Scenario:NA13_BST-135793_Welsh Reform Proposal - [SIT] - [WAR-491]-Validate No action will be linked to parent request
	Given User uses test data with ID 'MR_004' from 'MaterialRedcution' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_UAT'
		| fieldName |
		| uprn      |
	And User is logged in to Dynamics application to work for "BST-80539_CR07" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field value
	#And User looked for 'Relationship Role' field value
	And User entered 0 days before date for 'Date Received' field value
	And User entered 25 days before date for 'Proposed Effective Date' field value
	#And User scroll to 'Planning Details' element
	#And User enter data for 'Reason for Portal Reference Omission' text area field value
	And User looked for 'Data Source Role' field value
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User enter data for 'BA Report Number' field value
	And User enter data for 'Reason For Validation' field value
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Parent_MR_Request' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'MaterialRedcution' for 'MR_005'
	#And User clicked on 1 position 'Find Hereditament' button
	And User click on 'Find Hereditament' button
	And User select 'UPRN' value from 'Search By' dropdown
	And User enters data in "UPRN" field
	And User clicked on 'Search' button
	And User slects spcific 'uprn' row from search hereditament results
	And User clicked on 'Select' button
	And User waits till Find Hereditament dialog disappears
	And User click on 'Save' button from 'dialog'
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	Then user asserts associated jobs row count '2' by "Refresh" grid
	And User get Supplementary Job details in the 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Material Reduction' request with 'Parent_MR_Request' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And user waits till app progress indicator disappears
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job_1' through 'All Jobs'
	#And User 'Assign' 'Material Reduction' 'Job Name' supplementory job type through 'All Jobs'	
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Present Band Sufficient' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	#And User closes dialog if still present
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Effective Date Change' job under Associated jobs
	#And user clicks on 'No Action Details' option from more tabs list
	And User clicked on 'No Action Details' tab under 'Job Form'
	Then user validates the No Action link  and clicks on it
	And User closes browser


@Ignore
Scenario:NA14_BST-135795_[SIT] E2E Welsh Reform Proposals -[WAR-491]-Validate No action will not be linked to parent request for proposal or appeal
	Given User uses test data with ID 'Proposals_013' from 'Proposals' sheet
	And User connects to the DB and retrieves the data for 'findHereditament_CAMBRIDGE'
		| fieldName |
		| uprn      |
	And User is logged in to Dynamics application to work for "E2E_Proposals_MR" case
	And User collapse if site map navigation expanded on left pane
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
	#And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field
	And User looked for value 'Test CouncilTaxPayer' in 'Council Tax Payer' field with keyboard
	And User clicks on 'Authority to Act Received' dropdown and select 'Yes' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Raise Enquiry Actions'
	And User looked for 'Request Type' field value
	And User looked for 'Job Type' field value
	And User looked for 'Reason/Ground' field value
	And User entered 60 days before date for 'Proposed Effective Date' field value
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
	
	And User clicks on 'Channel' dropdown and select 'Email' value
	And User looked for 'Submitted By' field value only when data not entered
	And User looked for 'Relationship Role' field value only when data not entered

	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Check CT Challenge' under 'Request Action'
	And User clicks on 'Yes' button on 'Check CT Challenge' dialog
	And User looked for value 'Proposal Or Appeal Alteration' in 'Job Type To Support Basis' field
	#And User entered 15 days before date for 'VT Decision Date' field value on 'dialog'
	And User clicks on 'All Necessary Information Provided' dropdown and select 'Yes' value
	And User enter 'Automation testing' in 'Rationale for Customers Assertion' field
	And User enter 'B' in 'Proposed Band' field
	#And User entered 25 days before date for 'Proposed Effective Date' field value on 'dialog'
	And User looked for 'Tax Payer Request Property Link' and selects '1' option value
	And User looked for 'Interested Party Request Property Link' and selects '2' option value
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Check Acceptance' button from 'dialog'
	#And User clicks on 'Save and continue' button on 'Unsaved changes' dialog,if appears
	And User clicks on 'OK' button on 'Leave this page?' dialog
	And User click on 'Complete Acceptance Check' button from 'menubar'
	And User clicks on 'OK' button on 'Complete Validity/Acceptance Check' dialog
	And user waits till app progress indicator disappears
	Then user validated 'Send non system generated correspondence Acknowledgment of Registration - VO7706' text
	And User clicks on 'OK' button element
	Then User validate 'Valid' value for 'Validity/Acceptance Decision' field
	And User click on 'Refresh' button from 'menubar' untill 'Complete' status display
	And User clicks on 'Go back' button
	And User clicked on 'Outbound Correspondence' tab under 'Request Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Status Reason' dropdown and select 'Sent' value
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Save & Close' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User fetch 'Request Name' in 'featureContext'
	And User clicks on 'Validate Request' under 'Request Action'
	And User click on 'Save & Close' button from 'dialog'
	And User waits till 'dialog' disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And user waits till app progress indicator disappears
	Then User validate below business stages on business journey header
		| BusinessStages |
		| Details        |
		| Researching    |
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Supplementary Job Requisition' under 'Job Actions'
	And User looked for 'Job Type' field value from 'TestDataPart3' for 'PAA_001'
	And User entered 25 days before date from calender for 'Proposed Effective Date' field value on 'dialog'
	And User click on 'Save' button from 'dialog'
	And user waits till 'Saving...' disappears on dialog
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'Continue' button on 'Confirm Supplementary Job Requisition' dialog
	And user waits till 'Saving...' disappears on dialog
	And User closes dialog if still present
	And User clicked on 'Associated Jobs' tab under 'Desktop Research Form'
	Then user asserts associated jobs row count '2' by "Refresh" grid
	And User get Supplementary Job details in 'featureContext'
	And User click on 'Requests' under 'Service' section
	And User filters 'Name' coloum for 'Proposal' request with 'Request Name' and navigate to it
	And User click on 'Related Jobs' tab from 'Request Form'
	Then user asserts related jobs row count '2' by "Refresh" grid
	And User captures all 2 Jobs "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' Supplementary 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And user waits till app progress indicator disappears
	And User clicks on 'No Action' under 'Job Actions'
	And User looked for value 'Created in error' in 'No Action Code' field
	And User clicks on '2' postion 'Save' button from 'dialog'
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Submit' button from 'dialog'
	And User clicks on 'OK' button on 'Submit No Action' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Ok' button on 'No Action' dialog
	And user waits till 'Saving...' 'progressbar' disappears
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'No Action' status display
	And User clicked on 'Associated Jobs' tab under 'Job Form'
	And User double click on 'Proposal' job under Associated jobs
	#And user waits for '5' secs
	And User clicked on 'No Action Details' tab under 'Job Form'
	#And user clicks on 'No Action Details' option from more tabs list
	Then user validates the No Action link  not present
	And User closes browser
#EndProposals




