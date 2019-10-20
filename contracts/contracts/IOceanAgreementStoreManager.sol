pragma solidity 0.5.2;
// Copyright BigchainDB GmbH and Ocean Protocol contributors
// SPDX-License-Identifier: (Apache-2.0 AND CC-BY-4.0)
// Code is Apache-2.0 and docs are CC-BY-4.0

/**
 * @title Agreement Store Manager
 * @author Ocean Protocol Team
 *
 * @dev Implementation of the Agreement Store.
 *      TODO: link to OEP
 *
 *      The agreement store generates conditions for an agreement template.
 *      Agreement templates must to be approved in the Template Store
 *      Each agreement is linked to the DID of an asset.
 */
contract IOceanAgreementStoreManager {


  /**
  * @dev Create a new agreement.
  *      The agreement will create conditions of conditionType with conditionId.
  *      Only "approved" templates can access this function.
  * @param _id is the ID of the new agreement. Must be unique.
  * @param _did is the bytes32 DID of the asset. The DID must be registered beforehand.
  * @param _conditionTypes is a list of addresses that point to Condition contracts.
  * @param _conditionIds is a list of bytes32 content-addressed Condition IDs
  * @param _timeLocks is a list of uint time lock values associated to each Condition
  * @param _timeOuts is a list of uint time out values associated to each Condition
  * @return the size of the agreement list after the create action.
  */
  function createAgreement(
    bytes32 _id,
    bytes32 _did,
    address[] memory _conditionTypes,
    bytes32[] memory _conditionIds,
    uint[] memory _timeLocks,
    uint[] memory _timeOuts
  ) public {

  }
}