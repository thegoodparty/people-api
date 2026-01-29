import swc from 'unplugin-swc'
import tsconfigPaths from 'vite-tsconfig-paths'
import { defineConfig } from 'vitest/config'

export default defineConfig({
  esbuild: false,
  plugins: [swc.vite(), tsconfigPaths()],
  test: {
    include: ['src/**/*.test.ts'],
    clearMocks: true,
  },
})
