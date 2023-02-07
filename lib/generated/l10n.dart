// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `AptosWallet`
  String get monowallet {
    return Intl.message(
      'AptosWallet',
      name: 'monowallet',
      desc: '',
      args: [],
    );
  }

  /// `Import wallet from private key`
  String get importWalletFromPrivateKey {
    return Intl.message(
      'Import wallet from private key',
      name: 'importWalletFromPrivateKey',
      desc: '',
      args: [],
    );
  }

  /// `Create new wallet`
  String get createNewWallet {
    return Intl.message(
      'Create new wallet',
      name: 'createNewWallet',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get action_done {
    return Intl.message(
      'Done',
      name: 'action_done',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Mnemonic phrase`
  String get inputKeyPharse {
    return Intl.message(
      'Enter the Mnemonic phrase',
      name: 'inputKeyPharse',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long`
  String get validatePass {
    return Intl.message(
      'Password must be at least 8 characters long',
      name: 'validatePass',
      desc: '',
      args: [],
    );
  }

  /// `Input`
  String get input {
    return Intl.message(
      'Input',
      name: 'input',
      desc: '',
      args: [],
    );
  }

  /// `Create password`
  String get createPassword {
    return Intl.message(
      'Create password',
      name: 'createPassword',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mnemonic phrase`
  String get mnemonicPhrase {
    return Intl.message(
      'Mnemonic phrase',
      name: 'mnemonicPhrase',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message(
      'Hide',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `This password will unlock your AptosWallet only on this device.`
  String get hintPasswordCreate {
    return Intl.message(
      'This password will unlock your AptosWallet only on this device.',
      name: 'hintPasswordCreate',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get blank {
    return Intl.message(
      '',
      name: 'blank',
      desc: '',
      args: [],
    );
  }

  /// `Must be at least 8 characters`
  String get mustBeAtLeast8Characters {
    return Intl.message(
      'Must be at least 8 characters',
      name: 'mustBeAtLeast8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Scanner`
  String get scanner {
    return Intl.message(
      'Scanner',
      name: 'scanner',
      desc: '',
      args: [],
    );
  }

  /// `Scan a code`
  String get scanACode {
    return Intl.message(
      'Scan a code',
      name: 'scanACode',
      desc: '',
      args: [],
    );
  }

  /// `Could not find viable url`
  String get couldNotFindViableUrl {
    return Intl.message(
      'Could not find viable url',
      name: 'couldNotFindViableUrl',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Aptos Wallet`
  String get monoWallet {
    return Intl.message(
      'Aptos Wallet',
      name: 'monoWallet',
      desc: '',
      args: [],
    );
  }

  /// `Share my public address`
  String get shareMyPublicAddress {
    return Intl.message(
      'Share my public address',
      name: 'shareMyPublicAddress',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Browser`
  String get browser {
    return Intl.message(
      'Browser',
      name: 'browser',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Tokens`
  String get tokens {
    return Intl.message(
      'Tokens',
      name: 'tokens',
      desc: '',
      args: [],
    );
  }

  /// `NFTs`
  String get nfts {
    return Intl.message(
      'NFTs',
      name: 'nfts',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any NFTs!`
  String get youDontHaveAnyNfts {
    return Intl.message(
      'You don\'t have any NFTs!',
      name: 'youDontHaveAnyNfts',
      desc: '',
      args: [],
    );
  }

  /// `Import Tokens`
  String get importTokens {
    return Intl.message(
      'Import Tokens',
      name: 'importTokens',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get receive {
    return Intl.message(
      'Receive',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `View full history`
  String get viewFullHistory {
    return Intl.message(
      'View full history',
      name: 'viewFullHistory',
      desc: '',
      args: [],
    );
  }

  /// `Scan for Receive Payment`
  String get scanForReceivePayment {
    return Intl.message(
      'Scan for Receive Payment',
      name: 'scanForReceivePayment',
      desc: '',
      args: [],
    );
  }

  /// `Wallet address copied`
  String get walletAddressCopied {
    return Intl.message(
      'Wallet address copied',
      name: 'walletAddressCopied',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Swap`
  String get swap {
    return Intl.message(
      'Swap',
      name: 'swap',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Wallet address`
  String get walletAddress {
    return Intl.message(
      'Wallet address',
      name: 'walletAddress',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Input Gas fee`
  String get inputGasFee {
    return Intl.message(
      'Input Gas fee',
      name: 'inputGasFee',
      desc: '',
      args: [],
    );
  }

  /// `Gas fee`
  String get gasFee {
    return Intl.message(
      'Gas fee',
      name: 'gasFee',
      desc: '',
      args: [],
    );
  }

  /// `Input Max Gas`
  String get inputMaxGas {
    return Intl.message(
      'Input Max Gas',
      name: 'inputMaxGas',
      desc: '',
      args: [],
    );
  }

  /// `Max Gas`
  String get maxGas {
    return Intl.message(
      'Max Gas',
      name: 'maxGas',
      desc: '',
      args: [],
    );
  }

  /// `Input Amount`
  String get inputAmount {
    return Intl.message(
      'Input Amount',
      name: 'inputAmount',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Mnemonic`
  String get mnemonic {
    return Intl.message(
      'Mnemonic',
      name: 'mnemonic',
      desc: '',
      args: [],
    );
  }

  /// `Secret recovery phrase copied`
  String get secretRecoveryPhraseCopied {
    return Intl.message(
      'Secret recovery phrase copied',
      name: 'secretRecoveryPhraseCopied',
      desc: '',
      args: [],
    );
  }

  /// `Secret recovery phrase`
  String get secretRecoveryPhrase {
    return Intl.message(
      'Secret recovery phrase',
      name: 'secretRecoveryPhrase',
      desc: '',
      args: [],
    );
  }

  /// `Write down your secret recovery phrase (tap to copy)`
  String get writeDownYourSecretRecoveryPhrasetapToCopy {
    return Intl.message(
      'Write down your secret recovery phrase (tap to copy)',
      name: 'writeDownYourSecretRecoveryPhrasetapToCopy',
      desc: '',
      args: [],
    );
  }

  /// `Notice`
  String get notice {
    return Intl.message(
      'Notice',
      name: 'notice',
      desc: '',
      args: [],
    );
  }

  /// `New password required`
  String get newPasswordRequired {
    return Intl.message(
      'New password required',
      name: 'newPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm password required',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get passwordNotMatch {
    return Intl.message(
      'Password not match',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Creating a wallet`
  String get creatingAWallet {
    return Intl.message(
      'Creating a wallet',
      name: 'creatingAWallet',
      desc: '',
      args: [],
    );
  }

  /// `Address copied`
  String get addressCopied {
    return Intl.message(
      'Address copied',
      name: 'addressCopied',
      desc: '',
      args: [],
    );
  }

  /// `Login with password`
  String get loginWithPassword {
    return Intl.message(
      'Login with password',
      name: 'loginWithPassword',
      desc: '',
      args: [],
    );
  }

  /// `Input password`
  String get inputPassword {
    return Intl.message(
      'Input password',
      name: 'inputPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Gas fee (Gwei)`
  String get gasFeeGwei {
    return Intl.message(
      'Gas fee (Gwei)',
      name: 'gasFeeGwei',
      desc: '',
      args: [],
    );
  }

  /// `Max gas (Gwei)`
  String get maxGasGwei {
    return Intl.message(
      'Max gas (Gwei)',
      name: 'maxGasGwei',
      desc: '',
      args: [],
    );
  }

  /// `Amount (eth)`
  String get amountEth {
    return Intl.message(
      'Amount (eth)',
      name: 'amountEth',
      desc: '',
      args: [],
    );
  }

  /// `Amount (wei)`
  String get amountWei {
    return Intl.message(
      'Amount (wei)',
      name: 'amountWei',
      desc: '',
      args: [],
    );
  }

  /// `Transaction request success!`
  String get transactionRequestSuccess {
    return Intl.message(
      'Transaction request success!',
      name: 'transactionRequestSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create wallet fail!`
  String get createWalletFail {
    return Intl.message(
      'Create wallet fail!',
      name: 'createWalletFail',
      desc: '',
      args: [],
    );
  }

  /// `Import wallet fail!`
  String get importWalletFail {
    return Intl.message(
      'Import wallet fail!',
      name: 'importWalletFail',
      desc: '',
      args: [],
    );
  }

  /// `Login to wallet fail! Check your password and try again.`
  String get loginToWalletFailCheckYourPasswordAndTryAgain {
    return Intl.message(
      'Login to wallet fail! Check your password and try again.',
      name: 'loginToWalletFailCheckYourPasswordAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Transaction request fail`
  String get transactionRequestFail {
    return Intl.message(
      'Transaction request fail',
      name: 'transactionRequestFail',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to logout?`
  String get doYouReallyWantToLogout {
    return Intl.message(
      'Do you really want to logout?',
      name: 'doYouReallyWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Scan QRCode`
  String get scanQrcode {
    return Intl.message(
      'Scan QRCode',
      name: 'scanQrcode',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Importing a wallet`
  String get importingAWallet {
    return Intl.message(
      'Importing a wallet',
      name: 'importingAWallet',
      desc: '',
      args: [],
    );
  }

  /// `The transaction is being processed`
  String get theTransactionIsBeingProcessed {
    return Intl.message(
      'The transaction is being processed',
      name: 'theTransactionIsBeingProcessed',
      desc: '',
      args: [],
    );
  }

  /// `Import wallet from seed phrase`
  String get importWalletFromSeedPhrase {
    return Intl.message(
      'Import wallet from seed phrase',
      name: 'importWalletFromSeedPhrase',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any Tokens!`
  String get youDontHaveAnyTokens {
    return Intl.message(
      'You don\'t have any Tokens!',
      name: 'youDontHaveAnyTokens',
      desc: '',
      args: [],
    );
  }

  /// `Import Token`
  String get importToken {
    return Intl.message(
      'Import Token',
      name: 'importToken',
      desc: '',
      args: [],
    );
  }

  /// `Anyone can create a token, including creating fake version of existing tokens. Lean more about scams and securoty risks.`
  String get warningWhenImportNewToken {
    return Intl.message(
      'Anyone can create a token, including creating fake version of existing tokens. Lean more about scams and securoty risks.',
      name: 'warningWhenImportNewToken',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message(
      'Warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Import NFTs`
  String get importNfts {
    return Intl.message(
      'Import NFTs',
      name: 'importNfts',
      desc: '',
      args: [],
    );
  }

  /// `Detecting NFT`
  String get detectingNft {
    return Intl.message(
      'Detecting NFT',
      name: 'detectingNft',
      desc: '',
      args: [],
    );
  }

  /// `Allow Mono to automatically detect nFT from OpenSea and display it on your Aptos wallet.\nEnable NFT detection in Settings`
  String get warningImportNfts {
    return Intl.message(
      'Allow Mono to automatically detect nFT from OpenSea and display it on your Aptos wallet.\nEnable NFT detection in Settings',
      name: 'warningImportNfts',
      desc: '',
      args: [],
    );
  }

  /// `Enter the collection ID`
  String get enterTheCollectionId {
    return Intl.message(
      'Enter the collection ID',
      name: 'enterTheCollectionId',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Token Address`
  String get tokenAddress {
    return Intl.message(
      'Token Address',
      name: 'tokenAddress',
      desc: '',
      args: [],
    );
  }

  /// `0x...`
  String get textHintAddress {
    return Intl.message(
      '0x...',
      name: 'textHintAddress',
      desc: '',
      args: [],
    );
  }

  /// `Token Icon`
  String get tokenIcon {
    return Intl.message(
      'Token Icon',
      name: 'tokenIcon',
      desc: '',
      args: [],
    );
  }

  /// `GNO`
  String get gno {
    return Intl.message(
      'GNO',
      name: 'gno',
      desc: '',
      args: [],
    );
  }

  /// `Token Decimal`
  String get tokenDecimal {
    return Intl.message(
      'Token Decimal',
      name: 'tokenDecimal',
      desc: '',
      args: [],
    );
  }

  /// `xx`
  String get xx {
    return Intl.message(
      'xx',
      name: 'xx',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get network {
    return Intl.message(
      'Network',
      name: 'network',
      desc: '',
      args: [],
    );
  }

  /// `Add a network`
  String get addANetwork {
    return Intl.message(
      'Add a network',
      name: 'addANetwork',
      desc: '',
      args: [],
    );
  }

  /// `available for swap`
  String get oEthAvailableForSwap {
    return Intl.message(
      'available for swap',
      name: 'oEthAvailableForSwap',
      desc: '',
      args: [],
    );
  }

  /// `Choose a token`
  String get chooseAToken {
    return Intl.message(
      'Choose a token',
      name: 'chooseAToken',
      desc: '',
      args: [],
    );
  }

  /// `Maximum slippage 2%`
  String get maximumSlippage2 {
    return Intl.message(
      'Maximum slippage 2%',
      name: 'maximumSlippage2',
      desc: '',
      args: [],
    );
  }

  /// `Get a quote`
  String get getAQuote {
    return Intl.message(
      'Get a quote',
      name: 'getAQuote',
      desc: '',
      args: [],
    );
  }

  /// `Convert to`
  String get convertTo {
    return Intl.message(
      'Convert to',
      name: 'convertTo',
      desc: '',
      args: [],
    );
  }

  /// `Converted from`
  String get convertedFrom {
    return Intl.message(
      'Converted from',
      name: 'convertedFrom',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Maximum slippage`
  String get maximumSlippage {
    return Intl.message(
      'Maximum slippage',
      name: 'maximumSlippage',
      desc: '',
      args: [],
    );
  }

  /// `If the exchange rate between the time of placing the order and the time of confirming the order changes, it is called 'slippage'. Your Swap will be automatically canceled if slippage exceeds your 'maximum slippage' setting.`
  String get messageSlippage {
    return Intl.message(
      'If the exchange rate between the time of placing the order and the time of confirming the order changes, it is called \'slippage\'. Your Swap will be automatically canceled if slippage exceeds your \'maximum slippage\' setting.',
      name: 'messageSlippage',
      desc: '',
      args: [],
    );
  }

  /// `Confirm seed phrase`
  String get confirmSeedPhrase {
    return Intl.message(
      'Confirm seed phrase',
      name: 'confirmSeedPhrase',
      desc: '',
      args: [],
    );
  }

  /// `You need confirm seed phrase text field!`
  String get youNeedConfirmSeedPhraseTextField {
    return Intl.message(
      'You need confirm seed phrase text field!',
      name: 'youNeedConfirmSeedPhraseTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter or paste your seed phrase above`
  String get enterOrPasteYourSeedPhraseAbove {
    return Intl.message(
      'Enter or paste your seed phrase above',
      name: 'enterOrPasteYourSeedPhraseAbove',
      desc: '',
      args: [],
    );
  }

  /// `Token detail`
  String get tokenDetail {
    return Intl.message(
      'Token detail',
      name: 'tokenDetail',
      desc: '',
      args: [],
    );
  }

  /// `Import wallet from privateKey`
  String get importWalletFromPrivatekey {
    return Intl.message(
      'Import wallet from privateKey',
      name: 'importWalletFromPrivatekey',
      desc: '',
      args: [],
    );
  }

  /// `Import Wallet`
  String get importWallet {
    return Intl.message(
      'Import Wallet',
      name: 'importWallet',
      desc: '',
      args: [],
    );
  }

  /// `Enter private key`
  String get enterPrivateKey {
    return Intl.message(
      'Enter private key',
      name: 'enterPrivateKey',
      desc: '',
      args: [],
    );
  }

  /// `PrivateKey`
  String get privatekey {
    return Intl.message(
      'PrivateKey',
      name: 'privatekey',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Job detail`
  String get jobDetail {
    return Intl.message(
      'Job detail',
      name: 'jobDetail',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get description {
    return Intl.message(
      'Description:',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Created date`
  String get createdDate {
    return Intl.message(
      'Created date',
      name: 'createdDate',
      desc: '',
      args: [],
    );
  }

  /// `Apply CV`
  String get applyCv {
    return Intl.message(
      'Apply CV',
      name: 'applyCv',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Email is required!`
  String get emailIsRequired {
    return Intl.message(
      'Email is required!',
      name: 'emailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required!`
  String get passwordIsRequired {
    return Intl.message(
      'Password is required!',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required!`
  String get confirmPasswordIsRequired {
    return Intl.message(
      'Confirm password is required!',
      name: 'confirmPasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password not matched!`
  String get passwordNotMatched {
    return Intl.message(
      'Password not matched!',
      name: 'passwordNotMatched',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Experience (Yrs)`
  String get experienceYrs {
    return Intl.message(
      'Experience (Yrs)',
      name: 'experienceYrs',
      desc: '',
      args: [],
    );
  }

  /// `Salary`
  String get salary {
    return Intl.message(
      'Salary',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Province`
  String get province {
    return Intl.message(
      'Province',
      name: 'province',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Major`
  String get major {
    return Intl.message(
      'Major',
      name: 'major',
      desc: '',
      args: [],
    );
  }

  /// `Select work experience`
  String get selectWorkExperience {
    return Intl.message(
      'Select work experience',
      name: 'selectWorkExperience',
      desc: '',
      args: [],
    );
  }

  /// `Short description`
  String get shortDescription {
    return Intl.message(
      'Short description',
      name: 'shortDescription',
      desc: '',
      args: [],
    );
  }

  /// `Work experience`
  String get workExperience {
    return Intl.message(
      'Work experience',
      name: 'workExperience',
      desc: '',
      args: [],
    );
  }

  /// `Enter email`
  String get enterEmail {
    return Intl.message(
      'Enter email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter full name`
  String get enterFullName {
    return Intl.message(
      'Enter full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `BirthDate`
  String get birthdate {
    return Intl.message(
      'BirthDate',
      name: 'birthdate',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone`
  String get enterPhone {
    return Intl.message(
      'Enter phone',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Choose province`
  String get chooseProvince {
    return Intl.message(
      'Choose province',
      name: 'chooseProvince',
      desc: '',
      args: [],
    );
  }

  /// `Add favorite`
  String get addFavorite {
    return Intl.message(
      'Add favorite',
      name: 'addFavorite',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Applied`
  String get applied {
    return Intl.message(
      'Applied',
      name: 'applied',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Change Avatar`
  String get changeAvatar {
    return Intl.message(
      'Change Avatar',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Select image`
  String get selectImage {
    return Intl.message(
      'Select image',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Get from gallery`
  String get getFromGallery {
    return Intl.message(
      'Get from gallery',
      name: 'getFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Get from Camera`
  String get getFromCamera {
    return Intl.message(
      'Get from Camera',
      name: 'getFromCamera',
      desc: '',
      args: [],
    );
  }

  /// `Wage Agreement`
  String get wageAgreement {
    return Intl.message(
      'Wage Agreement',
      name: 'wageAgreement',
      desc: '',
      args: [],
    );
  }

  /// `Your CV Applied successfully!`
  String get yourCvAppliedSuccessfully {
    return Intl.message(
      'Your CV Applied successfully!',
      name: 'yourCvAppliedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Job has been save successfully!`
  String get jobHasBeenSaveSuccessfully {
    return Intl.message(
      'Job has been save successfully!',
      name: 'jobHasBeenSaveSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Career applied`
  String get careerApplied {
    return Intl.message(
      'Career applied',
      name: 'careerApplied',
      desc: '',
      args: [],
    );
  }

  /// `Career Saved`
  String get careerSaved {
    return Intl.message(
      'Career Saved',
      name: 'careerSaved',
      desc: '',
      args: [],
    );
  }

  /// `Update profile success!`
  String get updateProfileSuccess {
    return Intl.message(
      'Update profile success!',
      name: 'updateProfileSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Weight(kg)`
  String get weightkg {
    return Intl.message(
      'Weight(kg)',
      name: 'weightkg',
      desc: '',
      args: [],
    );
  }

  /// `Enter weight`
  String get enterWeight {
    return Intl.message(
      'Enter weight',
      name: 'enterWeight',
      desc: '',
      args: [],
    );
  }

  /// `Enter Height(cm)`
  String get enterHeightcm {
    return Intl.message(
      'Enter Height(cm)',
      name: 'enterHeightcm',
      desc: '',
      args: [],
    );
  }

  /// `Height(cm)`
  String get heightcm {
    return Intl.message(
      'Height(cm)',
      name: 'heightcm',
      desc: '',
      args: [],
    );
  }

  /// `Choose Major`
  String get chooseMajor {
    return Intl.message(
      'Choose Major',
      name: 'chooseMajor',
      desc: '',
      args: [],
    );
  }

  /// `Enter description`
  String get enterDescription {
    return Intl.message(
      'Enter description',
      name: 'enterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Do you want logout?`
  String get doYouWantLogout {
    return Intl.message(
      'Do you want logout?',
      name: 'doYouWantLogout',
      desc: '',
      args: [],
    );
  }

  /// `Contact`
  String get contact {
    return Intl.message(
      'Contact',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `English Level`
  String get englishLevel {
    return Intl.message(
      'English Level',
      name: 'englishLevel',
      desc: '',
      args: [],
    );
  }

  /// `Min Salary`
  String get minSalary {
    return Intl.message(
      'Min Salary',
      name: 'minSalary',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
