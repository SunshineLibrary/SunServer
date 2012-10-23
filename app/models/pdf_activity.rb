class PdfActivity < Activity
    def gen_cutted_pdf
        `bash gen_pdf_7.sh #{self.content_file.path}`

        file_name = self.content_file.path
        file_name[".pdf"] = "_7.pdf"
        self.modified_file1 = open file_name

        `bash gen_pdf_8.sh #{self.content_file.path}`
        file_name["_7.pdf"] = "_8.pdf"
        self.modified_file2 = open file_name

        self.save
    end
end
