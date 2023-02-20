return {
  {
    "dense-analysis/neural",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "elpiloto/significant.nvim",
    },
    cmd = "Neural",
    opts = {
      source = {
        openai = {
          api_key = os.getenv "OPENAI_SECRET_KEY",
        },
      },
    },
  },
}
