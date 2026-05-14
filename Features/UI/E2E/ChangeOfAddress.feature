@UI
Feature: Change of Address

@ChangeOfAddress @E2E @P1_A @Regression @mini_Regression
Scenario: COA01_CTPRELMGMT-1653_Validate the Change of Address till Release and Publish 
	Given User uses test data with ID 'COA_008' from 'ChangeOfAddress' sheet
	#And User connects to the DB and retrieves the data for 'findhereditamentForVOAAddress'
	And User connects to the DB and retrieves the unique VOA change of address 'FindVOA_Hereditament'
		#findhereditamentForVOAAddress
		| fieldName           |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_name             |
		| ba_reference        |
	And User is logged in to Dynamics application to work for "AutoProcess Change of Address" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 1 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
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
	And User scroll to 'Change of Address' element
	And User click on 'Find Address' button
	#And user slects Unique address for change of address manual process validation
	And user slects Unique address for change of address Auto process validation
	#And User clicked on 2 position 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results for new property
	#And User clicked on 'Use Address' button
	Then User validate value 'Duplicate Validation Passed' for 'Status Reason' field
	#And user select the 'find address' for change of address
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	#And User waits till ProgressRing disappears
	And user waits till progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And user waits till app progress indicator disappears
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status displayed
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Addresses' details under 'PVT' tab
		| Status    | AddressSource       |
		| Committed | Official UK Address |
		| Committed | VOA Created Address |
	And User closes browser

@ChangeOfAddress @E2E @HP_E2E @Regression @CPC_COA
Scenario: COA02_CPC02_CTPRELMGMT-1614_CTPRELMGMT-1600_CTPRELMGMT-1652_Change of Address - BA send request asking for sub building name/number(VOA Created Address) to be changed from current date (Official UK Address) after Composite Property Dwelling
Given User uses test data with ID 'CPC_003' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the unique VOA change of address 'FindVOA_Hereditament'
		#findhereditamentForVOAAddress
		| fieldName           |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_name             |
		| ba_reference        |
	And User is logged in to Dynamics application to work for "Composite dwelling property followed by Change of Address" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
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
	And user waits till app progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Composite Now Wholly Domestic' value
	And User enter data for 'Related Composite Property' field value
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
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
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
	And User closes business process stage container,if still available
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | No            | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                         |         | No            | Current (live entry) | Published         | Alteration       |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         |               |
	And User switchs to deafult frame
	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'Status Reason' dropdown and select 'Ready' value
	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
	And User selected 'Integration Messages' under 'Related' tab
	And User click on messages "Job Id" element
	And User captures 'Message' text area field in 'featureContext'
	Then User validates 'Quadient Message' contains 'CL28' data

	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	#And User looked for 'Job Type' field value
	And User looked for 'Job Type' field value from 'ChangeOfAddress' for 'COA_011'
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
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
	And User scroll to 'Change of Address' element
	And user waits till app progress indicator disappears
	And user select the 'find address' for change of address
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And user waits till progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And user waits till app progress indicator disappears
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status displayed
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Addresses' details under 'PVT' tab
		| Status    | AddressSource       |
		| Committed | Official UK Address |
		| Committed | VOA Created Address |
	And User closes browser


#CTPRELMGMT-1613_E2E-CL21 (Now Composite) -Validate the change code CL21 (Now Composite) -CR06 Report through LA Portal
@ChangeOfAddress @Regression @HP_E2E @E2E @CPC_COA
Scenario: COA03_CTPRELMGMT-1651_CTPRELMGMT-1613_Change of Address - BA send request asking for building number(VOA Created Address) to be changed to Official UK Address Before Composite Dwelling Job
	Given User uses test data with ID 'COA_013' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the unique VOA change of address 'FindVOA_Hereditament'
		#findhereditamentForVOAAddress
		| fieldName           |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_name             |
		| ba_reference        |
	And User is logged in to Dynamics application to work for "Change of Address followed by Composite Dwelling Property" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
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
	And User scroll to 'Change of Address' element
	And User click on 'Find Address' button
	#And user slects Unique address for change of address manual process validation
	And user slects Unique address for change of address Auto process validation
	#And User clicked on 2 position 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results for new property
	#And User clicked on 'Use Address' button
	Then User validate value 'Duplicate Validation Passed' for 'Status Reason' field
	#And user select the 'find address' for change of address
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And user waits till app progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And user waits till app progress indicator disappears
    And  User click on 'Refresh' button from 'menubar' untill 'Resolved' status displayed
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Addresses' details under 'PVT' tab
		| Status    | AddressSource       |
		| Committed | Official UK Address |
		| Committed | VOA Created Address |
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value from 'ChangeOfAddress' for 'CPC_004'
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 0 days before date for 'Date Received' field value
	And User enters '2' days after hereditament 'effective_from_date' for 'Proposed Effective Date' field value
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
	And User click on 'Jobs' under 'Service' section
	And user waits for '20' secs
	And User 'Assign' 'Job Name' through 'All Jobs'
	#And User 'Assign' 'Job ID' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And User waits till 'Details' stage selected
	And User clicked on 'Next Stage' for 'Details' journey on the headerbar
	And User waits till 'Researching' stage selected
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User scroll to 'Correspondence Address' element	
	And User clicks on 'Composite Change Type' dropdown and select 'Previously Wholly Domestic Now Composite' value
	And User enter data for 'Related Composite Property' field value
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
	And User clicks on 'Yes' button on 'Need review for NDR assessment' dialog
	And User clicks on 'Yes' button on 'Need confirmation for exchange document' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicked on 'Next Stage' for 'Researching' journey on the headerbar
	And User waits till 'Undertake Banding' stage selected
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
	And User closes business process stage container,if still available
	And User clicked on 'Assessment' tab under 'Job Form'
	And User waits till ProgressRing disappears
	And User switchs to Assessment frame
	And User clicked on 'Created Assessments' button
	Then User asserts below 'Created Assessments' details
		| Effective_From          | Effective_To | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |              |         | Yes           | Current (live entry) | Unpublished       | Alteration       |
	And User switchs to deafult frame
	And User clicked on 'Maintain Assessment' BPF Journey button
	And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
	And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
	And User clicks on 'Yes' button on 'Complete Job' dialog
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
	And User clicked on 'Details' tab under 'Job Form'
	And User click on 'Request' link
	And User clicks on 'Release and Publish' under 'Request Action'
	And User clicks on 'OK' button element
	And User closes dialog if still present
	And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
	And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To            | TaxBand | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                         |         | Yes           | Current (live entry) | Published         | Alteration       |
		| effective_from_date     | Proposed Effective Date |         | No            | Previously Current   | Published         | New              |
	And User switchs to deafult frame
	And User clicked on 'Outbound Correspondence' tab under 'Job Form'
	And User captures correspondence "Job ID" in "featureContext" by "Refresh" grid
	And User click on correspondence "Job Id" element
	And User clicks on 'Status Reason' dropdown and select 'Ready' value
	And User clicks on 'OK' button on 'Outbound Correspondence' dialog
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User 'Refresh' from 'menubar' until 'Status Reason' field set to 'Sent'
	And User selected 'Integration Messages' under 'Related' tab
	And User click on messages "Job Id" element
	And User captures 'Message' text area field in 'featureContext'
	Then User validates 'Quadient Message' contains '(Composite)' data
	Then User validates 'Quadient Message' contains 'CL21' data
	And User closes browser


@ChangeOfAddress @Regression @P1_A @E2E @mini_Regression
Scenario: COA04_CTPRELMGMT-1643_Validate the Change of Address till Release and Publish Manual Validation
	Given User uses test data with ID 'COA_014' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the unique VOA change of address 'FindVOA_Hereditament'
		#findhereditamentForVOAAddress
		| fieldName           |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_name             |
		| ba_reference        |
	And User is logged in to Dynamics application to work for "Manual Validation of Change of Address" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 0 days before date for 'Date Received' field value
	And User entered 2 days before date for 'Proposed Effective Date' field value
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
	And User scroll to 'Change of Address' element
	And User click on 'Find Address' button
	And User clicked on 2 position 'Search' button
	And user slects already used address for change of address manual process validation
	And User click on 'Use Proposed Address' as title for button
	Then User validate value 'Duplicate Validation Failed' for 'Status Reason' field
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	And user waits till app progress indicator disappears
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
	And User clicked on 'Change of Address' tab under 'Desktop Research Form'
	And User click on 'Find Address' button
	#And User clicked on 2 position 'Search' button
	And user slects Unique address for change of address manual process validation
	#And User slects spcific 'uprn' row from search hereditament results for new property
	#And User clicked on 'Use Address' button
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	Then User validate value 'Duplicate Validation Passed' for 'Status Reason' field
	And User clicked on 'Check Facts' tab under 'Desktop Research Form'
	And User click on 'Refresh' button from 'menubar'
	And User clicks on 'Is Desktop Research Complete?' dropdown and select 'Yes' value
	#And User clicks on 'Yes' button on 'All Jobs Created for Request' dialog
	#And user waits till 'Saving...' 'progressbar' disappears
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
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status displayed
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Addresses' details under 'PVT' tab
		| Status    | AddressSource       |
		| Committed | Official UK Address |
		| Committed | VOA Created Address |
	And User closes browser


	

@ChangeOfAddress @SIT @P2 @Regression @Integration @LAportal @HP_E2E
Scenario: COA05_CTPRELMGMT-1676_E2E - CT Change of Address from Submission on LA Portal to Release and Publish - Minor Change of Address
	Given User uses test data with ID 'TD_005' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the data for 'Find_LA_portal'
		| fieldName           |
		| band                |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_reference        |
		| ba_code             |
		| ba_name             |
	And User is logged in to LA Portal to work for "COA_MinorChange_LA_Portal_Submission" case
	When I click Single report tab
	Then I choose 'CR14' as the reason code for the submission
	And User enter details on References page from db
	And User clicks on continue and selectes the council tax band for Minor Change of Address
	And User enter details on Contact Details page
	And User enter EFfective Date and Remarks on Change request details page
	And I should be able to see "You have successfully submitted your report to the Valuation Office Agency" message on the screen
	Given User is logged in
	And User navigates to 'Submissions' under 'Service'
	And User filters the 'Channel' column with 'Integration' value
	And User clicks on the latest submission from LA Portal
	Then User validates the field values in Details section under Summary tab
	And User clicks on the Request link containing the Submission ID under Related Requests section
	And user waits till app progress indicator disappears
	And user waits till progress indicator disappears
	Then User validates the field values in Remarks section under Summary tab
	And User closes browser

@ChangeOfAddress @SIT @P2 @Regression @Integration @LAportal @HP_E2E
Scenario: COA06_CTPRELMGMT-1657_E2E - CT Change of Address from Submission on LA Portal to Release and Publish - Major Change of Address
	Given User uses test data with ID 'TD_005' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the data for 'Find_LA_portal'
		| fieldName           |
		| band                |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_reference        |
		| ba_code             |
		| ba_name             |
	And User is logged in to LA Portal to work for "COA_MajorChange_LA_Portal_Submission" case
	When I click Single report tab
	Then I choose 'CR12' as the reason code for the submission
	And User enter details on References page from db
	And User clicks on continue and selectes the council tax band for Minor Change of Address
	And User enter details on Contact Details page
	And User enter EFfective Date and Remarks on Change request details page
	And I should be able to see "You have successfully submitted your report to the Valuation Office Agency" message on the screen
	Given User is logged in
	And User navigates to 'Submissions' under 'Service'
	And User filters the 'Channel' column with 'Integration' value
	And User clicks on the latest submission from LA Portal
	Then User validates the field values in Details section under Summary tab
	And User clicks on the Request link containing the Submission ID under Related Requests section
	And user waits till app progress indicator disappears
	And user waits till progress indicator disappears
	Then User validates the field values in Remarks section under Summary tab
	And User closes browser

	@ChangeOfAddress @E2E @Regression
Scenario: COA07_CTPRELMGMT-1692_Change of Address - BA send request asking for Building/Flat Number(VOA Created Address) to be changed to (Official UK Address) 
	Given User uses test data with ID 'COA_008' from 'ChangeOfAddress' sheet
	And User connects to the DB and retrieves the unique VOA change of address 'FindVOA_Hereditament'
		#findhereditamentForVOAAddress
		| fieldName           |
		| uprn                |
		| town                |
		| postcode            |
		| effective_from_date |
		| ba_name             |
		| ba_reference        |
	And User is logged in to Dynamics application to work for "AutoProcess Change of Address and MR" case
	And User collapse if site map navigation expanded on left pane
	And User click on 'Requests' under 'Service' section
	And User click on 'New' button from 'menubar'
	And User looked for 'Job Type' field value
	And User looked for 'Submitted By' field with 'ba_name' from feature context
	And User entered 1 days before date for 'Date Received' field value
	And User entered 30 days before date for 'Proposed Effective Date' field value
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
	And User scroll to 'Change of Address' element
	And User click on 'Find Address' button
	#And user slects Unique address for change of address manual process validation
	And user slects Unique address for change of address Auto process validation
	#And User clicked on 2 position 'Search' button
	#And User slects spcific 'uprn' row from search hereditament results for new property
	#And User clicked on 'Use Address' button
	Then User validate value 'Duplicate Validation Passed' for 'Status Reason' field
	#And user select the 'find address' for change of address
	And User click on 'Save' button from 'menubar'
	And user waits till 'Saving...' 'progressbar' disappears
	And User clicks on 'Validate Request' under 'Request Action'
	#And User waits till ProgressRing disappears
	And user waits till progress indicator disappears
	And User click on 'Related Jobs' tab from 'Request Form'
	And User captures "Job ID" and "Job Name" in "featureContext" by "Refresh" grid
	#Given User click on 'Queues' under 'Service' section
	#And User filter 'Title' coloumn filter by 'equals' with 'Job Name' and 'pick'
	And User click on 'Jobs' under 'Service' section
	And User 'Assign' 'Job Name' through 'All Jobs'
	And user waits till progress indicator disappears
	And user waits till 'Saving...' 'progressbar' disappears
	And User click on "Job Id" element
	And user waits till app progress indicator disappears
	And User click on 'Refresh' button from 'menubar' untill 'Resolved' status displayed
	And User clicked on 'PVT' tab under 'Job Form'
	Then User validate 'Addresses' details under 'PVT' tab
		| Status    | AddressSource       |
		| Committed | Official UK Address |
		| Committed | VOA Created Address |
	
And User click on 'Requests' under 'Service' section
And User click on 'New' button from 'menubar'
And User looked for 'Job Type' field value from 'TestDataPart3' for 'TD_007'
And User looked for 'Submitted By' field with 'ba_name' from feature context
#And User looked for 'Relationship Role' field value
And User entered 0 days before date for 'Date Received' field value
And User entered 10 days before date for 'Proposed Effective Date' field value
And User scroll to 'Planning Details' element
And User enter data for 'Reason for Portal Reference Omission' text area field value
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
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Check Facts' tab under 'Desktop Research Form'
And User scroll to 'Linked Assessment' element
And User clicks on 'Composite Indicator' dropdown and select 'Yes' value
And User click on 'Save' button from 'menubar'
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'PVT' tab under 'Desktop Research Form'
And User selects 'Committed' record
And User get PAD attributes of 'Committed' record
And User clicked on 'Clone to New Date' button
And User clicked on 'Committed' button
#And User entered data for 'Enter the Effective Date for the new set of PADs' field value on dialog
And User entered 25 days before date from calender for 'Enter the Effective Date for the new set of PADs' field value on 'dialog'
And User clicked on 'Continue' button
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
And User validate value 'Pass' for 'PAD Validation Outcome' field
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
#And User clicked on 'Banding' tab under 'Job Form'
And User enter data for Caseworker Conclusions / Remarks / Thought Process field
And User looked for 'Proposed Tax Band' and reduced 1 step from "Current Tax Band" band value
And User clicks on 'Is Banding Complete?' dropdown and select 'Yes' value
And User clicks on 'Confirm and Lock Banding' button on 'Complete and Lock Banding' dialog
And user waits till 'Saving...' 'progressbar' disappears
And User clicked on 'Next Stage' for 'Undertake Banding' journey on the headerbar
And User waits till 'Maintain Assessment' stage selected
And User closes business process stage container
And User switchs to Assessment frame
And User clicked on 'Created Assessments' button
And User asserts below 'Created Assessments' details
	| Effective_From          | Effective_To | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
	| Proposed Effective Date |              | Proposed Tax Band | Yes           | Current (live entry) | Unpublished       | Alteration       |
And User switchs to deafult frame
And User clicked on 'Maintain Assessment' BPF Journey button
And User clicks on 'Correspondence Checks Complete?' dropdown and select 'Yes' value
And User clicks on 'Maintain Assessment Complete?' dropdown and select 'Yes' value
And User clicks on 'Yes' button on 'Complete Job' dialog
And user waits till progress indicator disappears
And user waits till 'Saving...' 'progressbar' disappears
And User click on 'Refresh' button from 'menubar' untill 'Pending Release' status display
And User clicked on 'Details' tab under 'Job Form'
And User click on 'Request' link
And User clicks on 'Release and Publish' under 'Request Action'
And User clicks on 'OK' button element
And User closes dialog if still present
And User click on 'Refresh' button from 'menubar' untill 'List Updated' status display
And User clicked on 'Assessment' tab under 'Job Form'
	And User switchs to Assessment frame
	And User clicked on 'History' button
	Then User asserts below 'History' details
		| Effective_From          | Effective_To            | TaxBand           | CompIndicator | AssessmentStatus     | PublicationStatus | AssessmentAction |
		| Proposed Effective Date |                         | Proposed Tax Band | No            | Current (live entry) | Published         |                  |
		| effective_from_date     | Proposed Effective Date | Current Tax Band  | No            | Previously Current   | Published         |                  |
And User closes browser
	
	