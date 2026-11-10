// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

/**
 * @title DSCEngine
 * @author Federico Chavez
 * The system is designed to be as minimal as possible, and have the tokens maintain a 1 token == $1 peg.
 * This stablecoin has the following properties:
 * Exogenous Collateral (ETH & BTC)
 * Algorithmic Supply
 * Pegged to USD
 */

contract DSCEngine {
  ///////////////
  //   ERRORS  //
  ///////////////
  error DSCEngine__NeedsMoreThanZero();
  error DSCEngine__TokenAddressesAndPriceFeedAddressesMustBeTheSameLength();

  ////////////////////
  // STATE VARABLES //
  ////////////////////
  mapping(address token => address priceFeed) private s_priceFeeds;
  DecentralizedStableCoin private immutable i_dsc;

  ///////////////
  // MODIFIERS //
  ///////////////
  modifier moreThanZero(uint256 amount) {
    if (amount <= 0) {
      revert DSCEngine__NeedsMoreThanZero();
    }
    _;
  }

  modifier isAllowedToken(address token) {
    _;
  }

  ///////////////
  // FUNCTIONS //
  ///////////////

  constructor(address[] memory tokenAddresses, address[] memory priceFeedAddresses, address dscAddress) {
    if (tokenAddresses.length != priceFeedAddresses.length) {
      revert DSCEngine__TokenAddressesAndPriceFeedAddressesMustBeTheSameLength();
    }

    for (uint256 i = 0; i < tokenAddresses.length; i++) {
      s_priceFeeds[tokenAddresses[i]] = priceFeedAddresses[i];
    }
  }

  ////////////////////////
  // EXTERNAL FUNCTIONS //
  ////////////////////////

  function depositCollateralAndMintDsc() external {}
  /**
   * 
   * @param tokenCollateralAddres the addres of the token 
   * @param amountCollateral amount of collateral to deposit
   * @notice this function will deposit collateral and mint DSC in one transaction
   */

  function depositCollateral(address tokenCollateralAddres, uint256 amountCollateral) external moreThanZero(amountCollateral) {

  }
  function redeemCollateralForDsc() external {}
  function redeemCollateral() external {}
  function mintDsc() external {}
  function burnDsc() external {}
  function liquidate() external {}
  function getHealthFactor() external view returns (uint256) {}
}