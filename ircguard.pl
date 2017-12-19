# Name:		ircguard-001.pl
# Version:	001
# Author:	LifeIsPain < idontlikespam (at) orvp [dot] net > multilinecatch-002.pl & modified by github.com/georou
# Date:		2017-10-10
# Description:	Require IRC messages to press enter twice

# Version History
# 001  2017-10-10 Modified to require double enter to send message

use strict;
use warnings;
use Xchat qw(:all);

register('Confirm IRC MSG catch', '003', 'Confirm you want to send a message');
hook_print('Key Press', \&check_multiline);

my $lastcheck = '';

sub check_multiline {
	if ($_[0][0] == 65293 || $_[0][0] == 65421) {
		my $checkstring = get_info('inputbox');
		#if ($checkstring ne $lastcheck && 2 < ($checkstring =~ tr/\n//s)) {
		if ($checkstring ne $lastcheck) {
			$lastcheck = get_info('inputbox');
			#prnt("The input box has too many line returns. If you really want to send this line, press Enter again.");
			return EAT_XCHAT;
		}
	}
	return EAT_NONE;
}