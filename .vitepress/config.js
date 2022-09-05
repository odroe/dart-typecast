import { defineConfig } from 'vitepress';

export default defineConfig({
  title: 'Prisma',
  description: '◭ Next-generation ORM for Dart Navtive & Flutter | PostgreSQL, MySQL, MariaDB, SQL Server, SQLite, MongoDB and CockroachDB',
  head: [
    ['link', { rel: 'icon', sizes: '32x32', href: '/assets/favicon-32x32.png' }],
    ['link', { rel: 'icon', sizes: '16x16', href: '/assets/favicon-16x16.png' }],
  ],
  themeConfig: {
    logo: {
      dark: {
        src: '/assets/logo-white.svg',
        alt: 'Prisma'
      },
      light: {
        src: "/assets/logo-dark.svg",
        alt: "Prisma"
      },
    },
    siteTitle: false,
    nav: [
      { text: 'Get Started', link: '/getting-started' },
      { text: 'Query Engine C API', link: '/capi' },
    ],
    socialLinks: [
      { icon: 'github', link: 'https://github.com/odroe/prisma-dart' },
    ]
  },
});
