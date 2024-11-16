import react from "@vitejs/plugin-react";
import { keycloakify } from "keycloakify/vite-plugin";
import { defineConfig } from "vite";

export const keycloakifyOptions: keycloakify.Params = {
    accountThemeImplementation: "none",
    themeName: "ladesa-ro",
    keycloakVersionTargets: {
        "22-to-25": false,
        "all-other-versions": "ladesa-ro-theme.jar"
    }
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
