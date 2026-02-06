local function smart_jump_new_tab(method)
	return function()
		local params = vim.lsp.util.make_position_params()
		vim.lsp.buf_request(0, method, params, function(err, result, ctx, config)
			if err then
				vim.api.nvim_err_writeln("Error: " .. err.message)
				return
			end
			if not result or vim.tbl_isempty(result) then
				return
			end

			local client = vim.lsp.get_client_by_id(ctx.client_id)
			local offset_encoding = client and client.offset_encoding or "utf-8"

			-- Handle result being list or single
			local location = result
			if vim.islist(result) then
				if #result > 1 then
					vim.lsp.handlers[method](err, result, ctx, config)
					return
				else
					location = result[1]
				end
			end

			-- Logic to smart open
			local uri = location.uri or location.targetUri
			if not uri then
				return
			end
			local fname = vim.uri_to_fname(uri)

			local escaped_fname = vim.fn.fnameescape(fname)

			-- Check if current buffer is expendable (empty/unmodified or alpha/dashboard)
			local cur_buf = vim.api.nvim_get_current_buf()
			local is_modified = vim.api.nvim_buf_get_option(cur_buf, "modified")
			local cur_name = vim.api.nvim_buf_get_name(cur_buf)
			local filetype = vim.api.nvim_buf_get_option(cur_buf, "filetype")

			local is_empty = (cur_name == "" and not is_modified)
			local is_alpha = (filetype == "alpha" or filetype == "dashboard" or filetype == "starter")
			local win_count = vim.fn.winnr("$")

			if is_empty or is_alpha or win_count > 1 then
				vim.cmd("edit " .. escaped_fname)
			else
				vim.cmd("tab drop " .. escaped_fname)
			end

			vim.lsp.util.jump_to_location(location, offset_encoding)
		end)
	end
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		vim.keymap.set("n", "gd", smart_jump_new_tab("textDocument/definition"), opts)
		vim.keymap.set("n", "gD", smart_jump_new_tab("textDocument/declaration"), opts)
		vim.keymap.set("n", "gi", smart_jump_new_tab("textDocument/implementation"), opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})
