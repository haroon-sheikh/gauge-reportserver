#!/bin/sh

# Copyright 2015 ThoughtWorks, Inc.

# This file is part of getgauge/html-report.

# getgauge/html-report is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# getgauge/html-report is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with getgauge/html-report.  If not, see <http://www.gnu.org/licenses/>.

#!/bin/sh

#Using protoc version 2.5.0

cd gauge-proto
PATH=$PATH:$GOPATH/bin protoc --go_out=../gauge_messages spec.proto messages.proto

cd ..
sed  -i.backup '/import gauge_messages1 "spec.pb"/d' gauge_messages/messages.pb.go && sed  -i.backup 's/gauge_messages1.//g' gauge_messages/messages.pb.go && rm gauge_messages/messages.pb.go.backup

sed -i.backup '/import "."/d' gauge_messages/messages.pb.go && rm gauge_messages/messages.pb.go.backup
go fmt github.com/sitture/gauge-reportserver/...