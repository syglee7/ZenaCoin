// Copyright (c) 2011-2014 The Zenacoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef ZENACOIN_QT_ZENACOINADDRESSVALIDATOR_H
#define ZENACOIN_QT_ZENACOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class ZenacoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit ZenacoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Zenacoin address widget validator, checks for a valid zenacoin address.
 */
class ZenacoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit ZenacoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // ZENACOIN_QT_ZENACOINADDRESSVALIDATOR_H
