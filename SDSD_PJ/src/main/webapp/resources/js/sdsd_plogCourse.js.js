/*
================================================
플로깅 코스 페이지 JavaScript
================================================
*/



jQuery(document).ready(function ($) {
    
    var btnAll = $('.plogCourseTab_row_01 .btn_container section .btnBox');
    var tabAll = $('.plogCourseTab_row_02 .content_container');


    // 강남
    $('#plogCourseTab_Icon_01').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#plogCourseTab_Info_01').addClass('active');
        }
    });

    // 강북
    $('#plogCourseTab_Icon_02').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#plogCourseTab_Info_02').addClass('active');
        }
    });
    
    // 경기 북부
    $('#plogCourseTab_Icon_03').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#plogCourseTab_Info_03').addClass('active');
        }
    });
    
    // 경기 남부
    $('#plogCourseTab_Icon_04').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#plogCourseTab_Info_04').addClass('active');
        }
    });

    // 부산
    $('#plogCourseTab_Icon_05').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#plogCourseTab_Info_05').addClass('active');
        }
    });

});

