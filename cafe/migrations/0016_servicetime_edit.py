# Generated by Django 4.0.4 on 2022-05-14 14:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cafe', '0015_servicetime'),
    ]

    operations = [
        migrations.AddField(
            model_name='servicetime',
            name='edit',
            field=models.CharField(default='Click Here', max_length=50),
        ),
    ]