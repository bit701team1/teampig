var headerContainer = $('.m_realheader-container');
var topPanel = headerContainer.find('#m_headertop-panel');
var searchHolder = headerContainer.find('.m_headersearch-holder');
var searchForm = headerContainer.find('#m_headeridsearch-form');
var openToggle = headerContainer.find('#m_headerform-open');
var closeToggle = searchForm.find('#m_headerform-close');

function calculateAnimationProps() {
    var vpWidth = $(window).outerWidth(true);
    var width = 0;

    if (vpWidth < 1000) {
        width = headerContainer.outerWidth(true) - 40; //
    } else {
        width = topPanel.outerWidth(true);
    }

    var right = width - openToggle.outerWidth(true);

    return {
        formWidth: width,
        formRight: right,
        toggleRight: right / 2
    };
}

$(document).ready(function () {
    openToggle.on('click', function () {
        var animProps = calculateAnimationProps();

        searchHolder.show().css({
            width: animProps.formWidth,
            height: headerContainer.outerHeight(true)
        });

        searchForm.css({
            width: animProps.formWidth,
            right: -(animProps.formRight),
            transform: 'translatex(-' + animProps.formRight + 'px)'
        }).addClass('active');

        $(this).css({
            right: animProps.toggleRight,
            transform: 'translatex(-' + animProps.toggleRight + 'px)'
        }).addClass('hidden');
    });

    closeToggle.on('click', function () {
        searchForm.css('transform', '')
            .removeClass('active');

        setTimeout(function () {
            searchHolder.hide();
        }, 500);

        openToggle.removeAttr('style')
            .removeClass('hidden');
    });

    searchForm.on('submit', function (e) {
        e.preventDefault();

        $(this).find('[name="qwrd"]')
            .val('');
    });
});
