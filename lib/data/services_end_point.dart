// class ServiceEndPoint {
// //  Todo: change the prifix before build
//   //TODO remove mws for local pc connection like http://172.16.215.34:8080/config/configbykey?&key=CHANNEL_AVAILABILITY

//   static const String PREFIX = "mws/";
//   static const String NG = "ng/";

//  // static const String PREFIX = "";

//   static const String PREFIX_BILL = "billgateway/";
// //    static const String PREFIX_BILL = "";

//   static const String PREFIX_BANGAQR = "bangla-qr/api/";
//   // static const String PREFIX_BANGAQR = "api/";

//   static const WHATS_NEW_IMAGE = PREFIX + "public";

//   static const String LOG_AUDIT = PREFIX + "public/invalidLoginAttempt";
// //App Update

//   // static const String APP_UPDATE_INFO = PREFIX + "app/info";
//   static const String APP_UPDATE_INFO = PREFIX + "app/info/v2";
// //CHeque req charge
//   static const String CHEQUE_REQUISITION_CHARGE =
//       PREFIX + "cheque/requisitionCharge/"; //{accCode}/{leafSize}
// // Limit

//   static const String FUND_TRANSFER_LIMIT = PREFIX + "limit/usage/"; // {userID}

//   static const String FEEDBACK_TYPE = PREFIX + "feedbacks/types";
//   static const String FEEDBACK_TYPE_local = PREFIX + "feedbacks/types";
//   static const String FEEDBACK = PREFIX + "feedbacks";
//   static const String FEEDBACK_local = PREFIX + "feedbacks";
//   static const String BANNER_LIST =
//       PREFIX + "public/static/images/group/App_Banner/metadata";
//   static const String BANNER_IMAGE_PREFIX = PREFIX + "banner/image/";

// //Change password

//   static const String PASSWORD_CHANGE =
//       PREFIX + "user/reset-password-and-logout";

//   static const String ACCOUNT_DELETE = PREFIX + "user/inactive-own-account";

// // Forgot passaword

//   // static const String FORGOT_USER_STATUS_CHECK =
//   //     PREFIX + "public/isUserLocked?";

//   static const String FORGOT_USER_STATUS_CHECK =
//       PREFIX + "public/isUserLocked1?";

//   static const String FORGOT_USER_RESET_LINK =
//       PREFIX + "public/password/reset/link";
//   static const String FORGOT_USER_VALIDATE_LINK_SEND_OTP =
//       PREFIX + "public/validateLinkThenTrySendOtp/"; //+link value
//   static const String FORGOT_USER_VALIDATE_RESET_LINK =
//       PREFIX + "public/validatePasswordResetLink/"; //+ link value
//   static const String FORGOT_USER_RESET_PASSWORD =
//       PREFIX + "public/validateForgotPasswordToken";
//   static const String REGISTRATION_VALIDATION =
//       PREFIX + "public/validateRegistrationParams";

// //Create account

//   static const String USERNAME_REX = PREFIX + "public/username/validity";
//   static const String USER_REGISTRATION_FIELD_REQUIREMENT =
//       PREFIX + "public/fieldValidation/registration";
//   // static const String USERNAME_CHECK =
//   //     PREFIX + "public/v1/isuserexist?&userName=";

//   static const String USERNAME_CHECK =
//       PREFIX + "public/v1/isuserexist1?&userName=";

//   static const String ACCOUNT_STATUS =
//       PREFIX + "public/accountstatus?&accountNo=";
//   static const String ACCOUNT_PHONE_NUMBER =
//       PREFIX + "public/getcustmobile?accno=";
//   static const String CREATE_ACCOUNT = PREFIX + "public/registration";

//   // Account Opening (SSP/MTDR)
//   static const String ACCOUNT_OPENING = PREFIX + "account-opening/create";
//   static const String ACCOUNT_OPENING_TENURES =
//       PREFIX + "account-opening/tenures";

//   static const String ACCOUNT_OPENING_TYPES = PREFIX + "account-opening/type";

//   static const String ACCOUNT_RENEW =
//       PREFIX + "account-opening/auto-renew"; //old
//   static const String ACCOUNT_OPENING_CONFIG =
//       PREFIX + "account-opening/config";
//   static const String ACCOUNT_OPENING_TENURE_AMOUNTS =
//       PREFIX + "account-opening/amounts";

//   static const String ACCOUNT_OPENING_TERMS_AND_CONDITION =
//       PREFIX + "public/terms-and-conditions";
//   //Secondary Auth
//   static const String SECONDARY_AUTH_REGEX =
//       PREFIX + "user/secondaryAuth/validity";
//   // static const String SECONDARY_AUTH = PREFIX + "user/securityidentity/apps";
//   static const String SECONDARY_AUTH = PREFIX + "user/securityidentity/apps1";
//   static const String SECONDARY_AUTH_POST =
//       PREFIX + "user/securityidentity/apps";

// //Bkash
//   static const String BKASH_PREFIX = "bkash/client/";

//   static const String BKASH_BENEFICIARY = BKASH_PREFIX + "beneficiaries/";
// //Nagad
//   static const NAGAD_PREFIX = "nagad/client/";

//   static const String NAGAD_BENEFICIARY = NAGAD_PREFIX + "verify-account/";

//   static const SET_LOGIN_STATUS =
//       "user/setuploginstatus"; //set login status only for app

// //Charge
//   static const String FUND_TRANSFER_CHARGE = PREFIX + "charge";

// //MiniStatementScreeen Download

//   static const String ACCOUNT_STATEMENT_DOWNLOAD =
//       PREFIX + "report/accstatement";
//   static const String ACCOUNT_STATEMENT_LAST_ALLOWED_DATE =
//       PREFIX + "report/accstatement/lastAllowedDate";
//   //

//   // AccountReceiptDownload

//   static const String ACCOUNT_RECEIPT_DOWNLOAD =
//       PREFIX + "account-opening/receipt";

//   static const String NEXT_PAYMENT_DATE = PREFIX + "account/nextinvpaydate?";

//   static const String ACCOUNT_MINI_STATEMENT = PREFIX + "account/";

//   static const String ACCOUNT_CHEQUES_STATUS = PREFIX + "account/";

//   static const String CHEQUES_STATUS_LIST = PREFIX + "cheque/status";
//   static const String CHEQUE_STOP_LIST =
//       PREFIX + "instructions/stopchequepay/all/"; //{customer-id}

//   static const String CHEQUES_STOP = PREFIX + "account/";
//   static const String CHEQUES_REQUISTIOSTION_DELETE = PREFIX + "cheque/cancel";

// //     static const String CHEQUE_REQUISITION_CANCEL = PREFIX+"account/cheque/requisition/cancel";

//   static const String CHEQUE_REQUISITION = PREFIX + "cheque";

//   static const String CHEQUE_REQUISITION_SETUP =
//       PREFIX + "cheque/leaf/setup/"; // / product id

//   static const String CHEQUE_REQUISITION_LIST = PREFIX + "cheque/";

//   static const String CHEQUE_REQUISITION_CANCEL = PREFIX + "cheque/cancel";

//   static const String ACCOUNT_DETAIL = PREFIX + "account/details?";
//   static const String ACCOUNT_LIST = PREFIX + "account/list/"; //+ customerID

//   static const String BANKS_OWN = PREFIX + "banks/own";

//   static const String BANKS = PREFIX + "banks";
//   static const String CARD_BANKS = PREFIX + "banks/cardBillPayable";

//   static const String BANKS_DISTRICTS = PREFIX + "districts";

//   static const String BANKS_BRANCHS = PREFIX + "banks/branches/own";

//   static const String BANKS_ATM = PREFIX + "banks/atmbooths/own";
//   static const String BANKS_OUTLET = PREFIX + "banks/outlets";

//   static const String BRANCH_BY_BREANCH_CODE =
//       PREFIX + "banks/branches/code/{branchcode}";

//   static const String BRANCH_BY_BANK_CODE_AND_DISTRICT_CODE =
//       PREFIX + "branches/bank-district-wise?";

//   static const String CARD_PAYMENT_BANKS = PREFIX + "banks/allcardbank";

//   static const String GET_BANK_CONTACT_INFO = PREFIX + "banks/contactinfo";

//   static const String BENEFICIARIES_FUND_TRANSFER =
//       PREFIX + "beneficiaries/fundTransferBeneficiary/user/";

//   static const String BENEFICIARIES_FUND_TRANNSFER_BY_TYPE =
//       PREFIX + "beneficiaries/{ftType}/category/{userid}/{type}";

//   static const String BENEFICIARIES = PREFIX + "beneficiaries";

//   static const String BENEFICIARIES_DELETE = PREFIX + "beneficiaries/";

//   static const String BENEFICIARIES_CARD_TRANSFER =
//       PREFIX + "beneficiaries/getallcreditcardbeneficiary?";

//   static const String CREDIT_CARD_BENEFICIARY_ADD =
//       PREFIX + "beneficiaries/createcreditcard";

//   static const String CREDIT_CARD_BENEFICIARY_UPDATE =
//       PREFIX + "beneficiaries/editcreditcard";

//   static const String CREDIT_CARD_BENEFICIARY_DELETE =
//       PREFIX + "beneficiaries/deletecreditcard/";

//   static const String GET_OPERATOR_LIST = PREFIX + "billpay/getoperatorlist";

//   static const String GET_BANK_CURRENCIES = PREFIX + "billpay/card/currency?";

//   static const String GET_CARD_BANK_LIST = PREFIX + "billpay/card/cardbanktype";

//   static const String GET_CARD_TRANSFER_CHANNELS =
//       PREFIX + "billpay/card/otherbank/channel/";

//   static const String BILL_PAY_CARD_OTHER_BANK =
//       PREFIX + "billpay/card/otherbank";

//   static const String BILL_PAY_TOP_UP = PREFIX + "billpay/topup";

//   static const String BILL_PAY_CARD = PREFIX + "billpay/card";
//   static const String BILL_PAY_CARD_OWN_BANK = PREFIX + "billpay/card/ownbank";

//   static const String BILL_PAY_CARD_BY_CARD_NUMBER = PREFIX + "billpay/cards/";

//   static const String CURRENCY_EXCHANGE_RATE =
//       PREFIX + "billpay/getexchangerate/{currencyShortName}?rateTypeCode=";

//   static const String CURRENCY_CONVERTION_RATE =
//       PREFIX + "billpay/getexchangerate/";

//   static const String GET_APP_CONFIG_BY_KEY = PREFIX + "config/configbykey?";

//   static const String CHECK_BENEF_LIMIT = PREFIX + "config/checkbeneflimit?";

//   static const String FAQ = PREFIX + "faq";

//   static const String FUND_TRANSFER_OWN_ACCOUNT =
//       PREFIX + "fundtransfer/ownAccount";

//   static const String FUND_TRANSFER_OWN_BANK = PREFIX + "fundtransfer/ownbank";
//   static const String CASH_WITHDRAW = PREFIX + "teller/withdraw";

//   static const String FUND_TRANSFER_OTHER_BANK =
//       PREFIX + "fundtransfer/otherbank";

//   // static const String FUND_TRANSFER_OTHER_BANK_CHANNEL =PREFIX + "fundtransfer/otherbank/channel";

//   ///fundtransfer/otherbank/channel/{beneficiaryId}
//   static const String FUND_TRANSFER_OTHER_BANK_CHANNEL =
//       PREFIX + "fundtransfer/otherbank/channel/";
//   static const String SAVE_STANDING_INSTRUCTION =
//       PREFIX + "instructions/standing";

//   static const String SAVE_STANDING_INSTRUCTION_NG =
//       PREFIX + "instructions/" + NG + "standing";
//   static const String GET_STANDING_INSTRUCTION_BY_ACCOUNT_NG =
//       PREFIX + "instructions/" + NG + "standing/";

//   static const String GET_STANDING_INSTRUCTION_CHARGE_NG =
//       PREFIX + "instructions/create/charge/";

//   static const String GET_STANDING_INSTRUCTION_BY_ACCOUNT =
//       PREFIX + "instructions/standing/";

//   static const String STANDING_INSTRUCTION_DELETE_NG =
//       PREFIX + "instructions/standing/";

//   //   static const String STANDING_INSTRUCTION_DELETE_NG =
//   // PREFIX + "instructions/" + NG + "standing/";
//   static const String INSTRUCTION_HISTORY_NG =
//       PREFIX + "instructions/" + NG + "standing/history/";

//   static const String INSTRUCTION_HISTORY =
//       PREFIX + "instructions/standing/history/";

//   static const String STANDING_INSTRUCTION_DELETE =
//       PREFIX + "instructions/standing/";

//   static const String LIMIT_CHECK = PREFIX + "limit/check";

//   static const String GET_MERCHANT_NAME =
//       PREFIX + "merchant/findmerchantbycode?";

//   static const String GET_ALL_NEWS_AND_EVENTS =
//       PREFIX + "news/allnewsandevents";

//   static const String GET_DISCOUNT_PARTNER =
//       PREFIX + "partner/alldiscountpartner";

//   static const String GET_EMI_PARTNER = PREFIX + "partner/allemipartners";

//   static const String PRODUCT_LIST = PREFIX + "product/getallproducts";

//   static const String PRODUCT_DETAIL = PREFIX + "product/getproductdesc?";

//   static const String USER_REGISTRATION = PREFIX + "public/registration";

//   static const String IS_ACCOUNT_VALID = PREFIX + "public/accountstatus?";

//   static const String ACCOUNT_NUMBER_VALIDATION =
//       PREFIX + "public/accountstatus/v2/?accountNo=";

//   static const String GET_EMI_CALCULATOR = PREFIX + "public/getemical";

//   static const String GET_EXCHANGE_RATE = PREFIX + "public/getexchangerates";

//   static const String IS_EMAIL_VALID = PREFIX + "public/getcustemail";

//   static const String IS_MOBIE_VALID = PREFIX + "public/getcustmobile";

//   static const String CARD_PAY_HISTORY =
//       PREFIX + "report/creditcardhistorylastntxn";

//   static const String TOP_UP_HISTORY = PREFIX + "report/topuphistorylastntxn";
//   static const String ADD_MONEY_HISTORY =
//       PREFIX + "report/addmoneyfromcardhistorylastntxn";

//   static const String ADD_MONEY_INIT_RESPONSE =
//       PREFIX + "sslcommerz/init-response";

//   static const String ADDMONEY_CARD_SUCCESS_MSG = PREFIX + "cms/charge";

//   static const String FUND_TRANSFER_HISTORY =
//       PREFIX + "report/fthistorylastntxn";

//   static const String UTILITY_BILL_HISTORY =
//       PREFIX + "report/utilitybillhistorylastntxn";
//   static const String BANGLA_QR_HISTORY = PREFIX + "report/mphistorylastntxn";

//   static const String RECENT_TXN = PREFIX + "report/lastntxn/{no}/{status}";

//   static const String SECURITY_OTP = PREFIX + "security/token";
//   static const String SECURITY_OTP_PUBLIC = PREFIX + "public/token";

//   static const String SECURITY_OTP_VALIDATE = PREFIX + "security/otp/validate";
//   static const String SECURITY_OTP_VALIDATE_PUBLIC =
//       PREFIX + "public/otp/validate";

//   static const String SECURITY_SOFT_TOKEN_ACTIVE =
//       PREFIX + "security/otp/softtoken/isactive";

//   static const String SECURITY_SOFT_TOKEN_SECRET =
//       PREFIX + "security/otp/secret";

//   static const String USER_LOGIN = PREFIX + "user/login";

//   static const String USER_DASHBOARD = PREFIX + "user/dashboard";

//   static const String PRIMARY_ACCOUNT_CHANGE =
//       PREFIX + "user/primaryaccount/change";

//   // static const String REGISTERED_DEVICE_CHECK =
//   //     PREFIX + "user/device/isregistered";
//   static const String REGISTERED_DEVICE_CHECK =
//       PREFIX + "user/device/isregistered1";

//   // static const String DEVICE_ACTIVATION_CHECK =
//   //     PREFIX + "user/device/isactivated";

//   // static const String DEVICE_ACTIVATION_CHECK =
//   //     PREFIX + "user/device/isactivated1";
//   static const String DEVICE_ACTIVATION_CHECK =
//       PREFIX + "user/device/isactivated2";

//   static const String DEVICE_REGISTRATION =
//       PREFIX + "user/device/registration/v1";

//   static const String FCM_DEVICE_REGISTRATION = PREFIX + "fcm/createfcm";

//   // static const String REGISTERED_DEVICE_LIST = PREFIX + "user/device/getall";
//   static const String REGISTERED_DEVICE_LIST = PREFIX + "user/device/getall1";

//   static const String DEVICE_ENABLE_DISABLE =
//       PREFIX + "user/devicesettingsforadmin";

//   static const String GET_USER_APP_CONFIG_BY_KEY =
//       PREFIX + "user/getclientuserconfig/validate?";

//   static const String SETUP_LOGIN_STATUS = PREFIX + "user/setuploginstatus";
//   static const String GET_USER_PROFILE_DATA = PREFIX + "user/userinfo2";

//   static const String USER_CHANGE_MOBILE_NUMBER = PREFIX + "user/change/mobile";

//   static const String USER_CHANGE_EMAIL = PREFIX + "user/change/email";

//   static const String PLAY_STORE =
//       "https://play.google.com/store/apps/details?id=";

//   static const String SET_LOGIN_INFO = PREFIX + "user/setlogin";

//   static const String BILL_PAY_GET_INFO = PREFIX_BILL + "bills/info";

//   static const String BILL_PAY_PAYMENT = PREFIX_BILL + "bills";
//   static const String IVAC_VISA_CENTER_LIST = "ivac/center";

//   static const String BILL_PAY_VENDORS = PREFIX_BILL + "serviceproviders/";
//   static const String BILL_PAY_VENDORS2 = PREFIX_BILL + "providers/";
//   static const String BILL_PAY_VENDORS_CATEGORY =
//       PREFIX_BILL + "billcategories";
//   static const String ADD_MONEY_INT_REQUEST =
//       PREFIX + "sslcommerz/init-request/";

//   static const String ADD_MONEY_FROM_OWN_BANK_CARD_INT_REQUEST =
//       PREFIX + "cms/init-request";
//   static const String ADD_MONEY_FROM_OWN_BANK_CARD_REQUEST =
//       PREFIX + "cms/submit-request";

//   static const String OWN_BANK_CARD_CHECK =
//       PREFIX + "beneficiary-validations/check";

//   static const String ADD_MONEY_CONFIG = PREFIX + "sslcommerz/configuration";

//   static const String ACCOUNT_DETAILS = PREFIX + "account/";

//   static const String ACCOUNT_INSTALLMENT_DETAILS =
//       PREFIX + "account/"; //account/{account-number}/installment-details";

//   static const String OUTLETS = PREFIX + "outlet/";
//   static const String EKYC_ENABLE = PREFIX + "public/ekyc/enable";

//   static const String BANGLAQR_INFO = PREFIX_BANGAQR + "retail/info";
//   static const String BANGLAQR_PAY = PREFIX_BANGAQR + "retail/pay";
//   static const String BANGLAQR_CARD_LIST = PREFIX_BANGAQR + "retail/card-list-get";
//   static const String BANGLAQR_CARD_BENEFICIARY_ADD = PREFIX_BANGAQR + "retail/card-beneficiary-add";
//   static const String BANGLAQR_CARD_INFO_GET = PREFIX_BANGAQR + "retail/card-info-get";
//   static const String BANFLAQR_CARD_DELETE = PREFIX_BANGAQR + "retail/card-delete";
//   // static const String BANGLAQR_INFO = "retail/info";
//   // static const String BANGLAQR_PAY = "retail/pay";
// }
