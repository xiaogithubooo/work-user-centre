/**
 * ./src/app/i18n.ts: 国际化配置
 *
 * 保证引入 import {useTranslation} from 'react-i18next';
 * 使用国际化文本只需要在 @/app/i18n.ts 文件中定义, 以及使用来支持国际化文本
 * const {t} = useTranslation();
 * {t("internationalization_text")}
 * 这样在点击右上角的语言切换按钮时就会进行自动翻译
 * 如果需要在组件外部使用, 则可以直接引入
 * import i18n from "@/app/i18n";
 * i18n.t("internationalization_text")
 */
import i18n from 'i18next';
import {initReactI18next} from 'react-i18next';
import zhCN from 'antd/es/locale/zh_CN';
import enUS from 'antd/es/locale/en_US';

// TODO: 把一些文本修改为国际化

i18n.use(initReactI18next).init({
    resources: {
        zh: {
            translation: {
                work_user_centre: "工作室用户中心",
                switch_language_button: "语言切换按钮",
                switch_theme_button: "主题切换按钮",
                welcome_to_work_user_centre: "欢迎来到工作室用户中心",
                made: "制作",
                by_work: "by 工作室",
                user_account: "账号",
                user_email: "邮箱",
                user_phone: "手机",
                user_birthday: "生日",
                user_gender: "性别",
                user_role: "角色",
                user_country: "国家",
                user_address: "地址",
                unknown: "未知"
            }
        },
        en: {
            translation: {
                work_user_centre: "Work User Centre",
                switch_language_button: "Switch Language Button",
                switch_theme_button: "Switch Theme Button",
                welcome_to_work_user_centre: "Welcome to Work User Centre",
                made: "Made",
                by_work: "by Work",
                user_account: "Account",
                user_email: "Email",
                user_phone: "Phone",
                user_birthday: "Birthday",
                user_gender: "Gender",
                user_role: "Role",
                user_country: "Country",
                user_address: "Address",
                unknown: "Unknown"
            }
        },
    },
    lng: 'zh', // 默认语言
    fallbackLng: 'en', // 默认回退语言
    interpolation: {
        escapeValue: false,
    },
});

export {zhCN, enUS};
export default i18n;
