        $(document).ready(function() {
            for (let i = 0; i < summerIdIndex; i++) {
                $('#summernote' + i).summernote({
                    fontSizes: ['8', '9', '10', '11', '12', '14',
                        '18', '24', '36', '48', '64', '82',
                        '150'
                    ],
                    height: 300,
                    lang: 'zh-CN',
                    focus: true
                })
            }
        });