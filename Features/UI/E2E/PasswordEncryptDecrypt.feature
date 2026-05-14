@UI
Feature: pwd encrypt and Decrypt


@tag1
Scenario: test pwd encrypt and Decrypt
	#Given User is logged in to Dynamics application to work for "E2E_Appeal_WithDrawn" case
	#And Login to Dynamics application with 'VOA Team Manager' user to work for "E2E_Appeal_WithDrawn" case
	#And User logged out from Dynamics application
	#And Login to Dynamics application with 'VOA New Estate Approver' user
	#And Login to Dynamics application with 'VOA New Estate Approver' user to work for "E2E_Appeal_WithDrawn" case
	#And User 'VOA New Estate Approver' is logged in to Dynamics application to work for "E2E_Appeal_WithDrawn" case
	And encrypt and decrypt given password
