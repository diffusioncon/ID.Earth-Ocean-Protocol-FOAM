pragma solidity 0.5.2;
// Copyright BigchainDB GmbH and Ocean Protocol contributors
// SPDX-License-Identifier: (Apache-2.0 AND CC-BY-4.0)
// Code is Apache-2.0 and docs are CC-BY-4.0

/**
 * @title DID Registry
 * @author Ocean Protocol Team
 *
 * @dev Implementation of the DID Registry.
 *      https://github.com/oceanprotocol/OEPs/tree/master/7#registry
 */
contract IOceanDIDRegistry {

  /**
   * @notice Register DID attributes.
   *
   * @dev The first attribute of a DID registered sets the DID owner.
   *      Subsequent updates record _checksum and update info.
   *
   * @param _did refers to decentralized identifier (a bytes32 length ID).
   * @param _checksum includes a one-way HASH calculated using the DDO content.
   * @param _value refers to the attribute value, limited to 2048 bytes.
   * @return the size of the registry after the register action.
   */
  function registerAttribute(
    bytes32 _did,
    bytes32 _checksum,
    address[] memory _providers,
    bytes32 _value
  ) public {

  }


}