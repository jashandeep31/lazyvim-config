return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        dockerls = {}, -- Dockerfile
        docker_compose_language_service = {}, -- docker-compose.yml
      },
    },
  },
}
