const token = artifacts.require('./SmartToken.sol')
const crowdsale = artifacts.require('./SmartCrowdsale.sol')

module.exports = function(deployer, network, accounts) {
	const openingTime = 1540402200; // 10/24/2018 @ 5:30pm (UTC)
    const closingTime = 1545672600; // 12/24/2018 @ 5:30pm (UTC)
    const rate = new web3.BigNumber(1); // 1 token per 1 ether
    const wallet = process.env.WALLET_ADDRESS; // wallet
    const cap = 200 * 1000000; // hardcap
    const goal = 100 * 1000000; // softcap



    return deployer
        .then(() => {
            return deployer.deploy(token);
        })
        .then(() => {
            return deployer.deploy(
                crowdsale,
                openingTime,
                closingTime,
                rate,
                wallet,
                cap,
                token.address,
                goal
            );
        })
        .then(() => {
            var tokenContract = web3.eth.contract(token.abi).at(token.address);
            web3.eth.defaultAccount = web3.eth.accounts[0];
            tokenContract.transferOwnership(crowdsale.address);
            tokenContract.addMinter(crowdsale.address);
        });
}