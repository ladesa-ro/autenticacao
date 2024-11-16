import react from "@vitejs/plugin-react";
import { keycloakify } from "keycloakify/vite-plugin";
import { defineConfig } from "vite";

export const keycloakifyOptions: keycloakify.Params = {
    accountThemeImplementation: "none",
    themeName: "ladesa-ro"
};

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [
        react(),
        keycloakify({
            ...keycloakifyOptions
        })
    ]
});
